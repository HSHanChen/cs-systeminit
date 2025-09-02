import re
import pandas as pd
import json
import yaml
import datetime
from decimal import Decimal
from collections import defaultdict


# ---------- 工具函数 ----------
def json_converter(o):
    if isinstance(o, (datetime.date, datetime.datetime)):
        return o.isoformat()
    if isinstance(o, Decimal):
        return float(o)
    return str(o)

def bracket(name: str) -> str:
    return f"[{name}]"

def parse_bool(val) -> bool:
    return str(val).strip().lower() in {"1", "true", "y", "yes", "是"}

def type_with_length(col_type: str, length: str) -> str:
    col_type = col_type.strip().upper()
    if re.search(r"\w+\s*\(", col_type):  # 已带长度
        return col_type
    if col_type in {"CHAR", "NCHAR", "VARCHAR", "NVARCHAR", "BINARY", "VARBINARY"}:
        return f"{col_type}({length or '255'})"
    return col_type

def sql_lit_default(val: str, is_string: bool) -> str:
    if not val or str(val).strip() == "":
        return ""
    raw = str(val).strip()
    if "(" in raw and raw.endswith(")"):  # 函数形式
        return raw
    return "N'" + raw.replace("'", "''") + "'" if is_string else raw

def get_max_length(col_type, length):
    if length:
        return length
    col_type = col_type.upper()
    return 10 if col_type=="INT" else 19 if col_type=="BIGINT" else 1 if col_type=="BIT" else 8 if col_type in {"DATE","DATETIME"} else 255

# ---------- Excel & YAML 加载 ----------
def load_excel(file_path):
    sheets = pd.ExcelFile(file_path, engine="openpyxl")
    columns, tables = {}, defaultdict(list)

    # Sheet/Columns处理
    if "Columns" in sheets.sheet_names:
        df = pd.read_excel(sheets, "Columns", dtype=str).fillna({"control": "TextBox"}).fillna("")
        for row in df.to_dict(orient="records"):
            row = {k.strip(): v for k, v in row.items() if v != ""}
            if row.get("code"):
                columns[row["code"]] = row

    # Sheet/Tables 处理
    if "Tables" in sheets.sheet_names:
        df = pd.read_excel(sheets, "Tables", dtype=str).fillna("")
        df = df[df['table_code'].notna() & (df['table_code'].str.strip() != "")]
        for row in df.to_dict(orient="records"):
            row = {k.strip(): v for k, v in row.items() if v != ""}
            table_code, col_code = row["table_code"], row["column"]
            base_col = columns.get(col_code, {}).copy()
            merged_col = {**base_col, **row}
            if row.get("name"):
                merged_col["column"] = row["name"]
            merged_col["pk"] = parse_bool(row.get("ispk", 0))
            tables[table_code].append(merged_col)

    return {"columns": columns, "tables": dict(tables)}

def load_yaml(yaml_file):
    with open(yaml_file, "r", encoding="utf-8") as f:
        return yaml.safe_load(f)


# ---------- 建表 SQL ----------
def gen_create_sqls(table_code: str, rows: list) -> str:
    col_defs, pk_cols = [], []
    for r in rows:
        col_name = r.get("code", r.get("column"))
        final_type = type_with_length(r.get("type", "VARCHAR"), r.get("length", ""))
        segs = [bracket(col_name), final_type]
        if parse_bool(r.get("identity", False)):
            segs.append("IDENTITY(1,1)")
        nullable = str(r.get("nullable", "")).lower()
        segs.append("NOT NULL" if parse_bool(r.get("pk", False)) or "false" in nullable else "NULL")
        if r.get("default"):
            lit = sql_lit_default(r["default"], final_type.startswith(("CHAR","NCHAR","VARCHAR","NVARCHAR")))
            if lit:
                segs.append(f"CONSTRAINT {bracket(f'DF_{table_code}_{col_name}')} DEFAULT {lit}")
        if parse_bool(r.get("pk", False)):
            pk_cols.append(bracket(col_name))
        col_defs.append(" ".join(segs))

    if table_code == "md_Organization":
        col_defs += ["[Emp1] INT NULL", "[OrderBy] INT NULL"]

    pk_clause = f",\n    CONSTRAINT {bracket(f'PK_{table_code}')} PRIMARY KEY CLUSTERED ({', '.join(pk_cols)} ASC)" if pk_cols else ""
    full_table = bracket(table_code)
    return f"IF OBJECT_ID(N'{full_table}', N'U') IS NOT NULL\n    DROP TABLE {full_table};\nGO\nCREATE TABLE {full_table} \n(\n    " + ",\n    ".join(col_defs) + pk_clause + "\n);\nGO\n"


# ---------- 索引/约束 SQL ----------
def gen_constraints_sql(constraints) -> list:
    sqls = []
    for tbl in constraints.get("meta", {}).get("settings", []):
        table_name, full_table = tbl["table"], bracket(tbl["table"])
        for cons in tbl.get("constraints", []):
            cons_type, columns = cons.get("type","").upper(), cons.get("columns", [])
            cols_str = ", ".join(bracket(c) for c in columns)
            name = cons.get("name") or (("UQ" if cons_type=="UNIQUE" else "IX") + f"_{table_name}_{'_'.join(columns)}")
            if cons_type == "UNIQUE":
                sqls.append(f"ALTER TABLE {full_table} ADD CONSTRAINT {bracket(name)} UNIQUE ({cols_str});\nGO\n")
            elif cons_type == "INDEX":
                sqls.append(f"CREATE NONCLUSTERED INDEX {bracket(name)} ON {full_table} ({cols_str});\nGO\n")
    return sqls

def gen_functions_sql(funcs, tables):
    sqls = []
    mapping = {"创建":1,"变更":2,"失效":3,"合并":4}
    for f in funcs:
        fid, code, title, table = f.get("id"), f.get("code"), f.get("name"), f.get("table")
        table_cols = [c.get("code", c.get("column")) for c in tables.get(table, [])]
        datasource = f"SELECT a.*\nFROM {table} a"
        conditions = []
        has_oper, has_closed = "OperType" in table_cols, "Closed" in table_cols
        if "历史" in title:
            if has_closed: conditions.append("a.Closed = 1")
        else:
            if has_oper:
                for k,i in mapping.items():
                    if k in title:
                        conditions.append(f"a.OperType = {i}")
                        break
            if has_closed: conditions.append("a.Closed = 0")
        if conditions: datasource += "\nWHERE " + "\n  AND ".join(conditions)

        add_new, update = "NULL", "NULL"
        if "RegBy" in table_cols and "历史" not in title:
            oper_val = next((i for k,i in mapping.items() if k in title), None)
            fields = ([f"{oper_val} AS OperType"] if oper_val else []) + ["${P_USERID} AS RegBy","GETDATE() AS RegTime"]
            for extra in ["Closed","Canceled","Offered","Submit"]:
                if extra in table_cols: fields.append(f"0 AS {extra}")
            add_new = "SELECT " + ", ".join(fields)
            update = "SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime"

        sqls.append(f"DELETE FROM mc_Functions WHERE ID = '{fid}';")
        sqls.append(f"INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)\nVALUES('{fid}','{code}',N'{title}','{datasource}','{add_new}','{update}');")
        sqls.append("GO\n")
    return "\n".join(sqls)

def gen_function_tool_sql(funcs):
    sqls = []
    attr_map = {
        "execsp": '''<tool>
  <hidden>0</hidden>
  <sqlbeforeclick></sqlbeforeclick>
  <sqlwhenclick></sqlwhenclick>
  <sqlafterclick></sqlafterclick>
  <linkcol></linkcol>
  <hidecol></hidecol>
  <confirm>0</confirm>
  <refresh>1</refresh>
  <cssclass>mc-btn-primary</cssclass>
  <icon>antd-right</icon>
  <color>#3293FF</color>
  <size></size>
  <toolprop class="linked-hash-map"/>
  <toolstyle></toolstyle>
  <showmode>0</showmode>
</tool>''',
        "popapp": '''<tool>
  <hidden>0</hidden>
  <popapp></popapp>
  <popappcondi><![CDATA[]]></popappcondi>
  <confirm>0</confirm>
  <refresh>0</refresh>
  <cssclass>mc-btn-dashed</cssclass>
  <icon>public-custom_query</icon>
  <color>#3293FF</color>
  <size></size>
  <showmode>2</showmode>
</tool>'''
    }
    for f in funcs:
        fid, tools = f.get("id"), f.get("tools", [])
        sqls.append(f"DELETE FROM mc_FunctionTools WHERE FCID = '{fid}';")
        for t in tools:
            t_code, t_name, t_type, t_xorder = t.get("code"), t.get("name"), t.get("type"), t.get("xorder")
            t_attribute = attr_map.get(t_type,"NULL")
            sqls.append(f"INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)\nVALUES('{fid}','{t_code}',N'{t_name}','{t_type}',{t_xorder},'table','{t_attribute}');")
        sqls.append("GO\n")
    return "\n".join(sqls)

def gen_function_cols_sql(funcs, tables, columns):
    sqls = []
    for f in funcs:
        fid, table_name = f.get("id"), f.get("table")
        for idx, col in enumerate(tables.get(table_name, []), start=1):
            col_code = col.get("column")
            if not col_code or f["code"] in ["Title1","Title2","Title3","Title4","Title5","Old_Title1","Old_Title2","Old_Title3","Old_Title4","Old_Title5"]:
                continue

            col_name, col_title = col_code, col.get("name", col_code)
            is_identity = 1 if parse_bool(col.get("identity", False)) else 0
            is_pkey = 1 if parse_bool(col.get("pk", False)) else 0
            nullable = parse_bool(col.get("nullable", True))
            locked = parse_bool(col.get("locked", False))
            hidden = parse_bool(col.get("hidden", True))
            form_hidden = parse_bool(col.get("form_hidden", False))
            grid_hidden = parse_bool(col.get("grid_hidden", False))

            col_base = columns.get(col_code,{})
            col_type = col_base.get("type","VARCHAR").upper()
            length = col_base.get("length","")
            scale = col_base.get("scale","NULL")
            control = col_base.get("control","TextBox")

            max_length = get_max_length(col_type,length)
            datetype = col.get("datetype","String")
            x_order = idx

            attribute = f"""<col>
  <datatype>{datetype}</datatype>
  <hidden>{1 if hidden else 0}</hidden>
  <gridhidden>{1 if grid_hidden else 0}</gridhidden>
  <formhidden>{1 if form_hidden else 0}</formhidden>
  <notnull>{0 if nullable else 1}</notnull>
  <control>{control}</control>
  <locked>{1 if locked else 0}</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>"""
            sqls.append(
                f"INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)\n"
                f"VALUES('{fid}',N'{col_title}','{col_name}','a','{col_name}',{is_pkey},{is_identity},{max_length},{scale},{x_order},'{attribute}');"
            )
        sqls.append("GO\n")
    return "\n".join(sqls)

# ---------- 主程序 ----------
if __name__=="__main__":
    excel_file, cons_file, funcs_file = "configs/configs.xlsx", "configs/constraints.yaml", "configs/functions.yaml"

    result = load_excel(excel_file)
    result["constraints"] = load_yaml(cons_file)
    tables, columns = result["tables"], result["columns"]
    functions = load_yaml(funcs_file)["functions"]

    # ---------- 导出 JSON ----------
    with open("configs/configs.json","w",encoding="utf-8") as f:
        json.dump(result,f,ensure_ascii=False,indent=4,default=json_converter)

    sql_text = []

    # ---------- 建表 SQL ----------
    for tbl, rows in tables.items():
        sql_text.append(gen_create_sqls(tbl, rows))

    # ---------- 索引/约束 ----------
    sql_text += gen_constraints_sql(result["constraints"])

    # ---------- Functions / Tools / Columns ----------
    sql_text.append(gen_functions_sql(functions,tables))
    sql_text.append(gen_function_tool_sql(functions))
    sql_text.append(gen_function_cols_sql(functions,tables,columns))

    # ---------- 写入 SQL 文件 ----------
    with open("configs/systeminit.sql","w",encoding="utf-8") as f:
        f.write("\n".join(sql_text))

    print(f"已生成 configs.json 和 systeminit.sql，统计: {len(tables)} 张表")

    # 数据库连接
    # conn = pyodbc.connect(
    #     'DRIVER={SQL Server};SERVER=localhost;DATABASE=JUSTIN;UID=sa;PWD=123456',
    #     autocommit=False
    # )
    # cursor = conn.cursor()
    # with open("init_sql.sql", "r", encoding="utf-8") as f:
    #     sql_script = f.read()
    #
    # try:
    #     for stmt in sql_script.split("\nGO\n"):
    #         stmt = stmt.strip()
    #         if not stmt:
    #             continue
    #         cursor.execute(stmt)
    #     conn.commit()
    # except Exception as e:
    #     conn.rollback()
    #     print("执行出错，已回滚：", stmt)
    #     raise
    #
    # finally:
    #     cursor.close()
    #     conn.close()


