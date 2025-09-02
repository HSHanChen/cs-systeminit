"""
@Author: Chan Sheen
@Date: 2025/9/1 17:49
@File: system_init.py
@Description: 
"""

import re
import pandas as pd
import yaml
import json
from collections import defaultdict
from decimal import Decimal
import datetime

# ---------- JSON 序列化 ----------
def json_converter(o):
    if isinstance(o, (datetime.date, datetime.datetime)):
        return o.isoformat()
    if isinstance(o, Decimal):
        return float(o)
    return str(o)

# ---------- 统一生成器 ----------
def gen_sql_scripts(
        excel_file,
        constraints_file,
        functions_file,
        json_out="configs.json",
        sql_out="system_init.sql"
):
    # ---------- 工具函数 ----------
    def bracket(name): return f"[{name}]"

    def parse_bool(val): return str(val).strip().lower() in {"1","true","y","yes","是"}

    def type_with_length(column_type, column_length):
        column_type = column_type.strip().upper()
        if re.search(r"\w+\s*\(", column_type): return column_type
        if column_type in {"CHAR","NCHAR","VARCHAR","NVARCHAR","BINARY","VARBINARY"}:
            return f"{column_type}({column_length or '255'})"
        return column_type

    def sql_lit_default(val, is_string):
        if not val or str(val).strip() == "": return ""
        raw = str(val).strip()
        if "(" in raw and raw.endswith(")"): return raw
        return "N'" + raw.replace("'","''") + "'" if is_string else raw

    def write_block(delete_stmt, insert_stmt):
        sqls.append(delete_stmt)
        sqls.append(insert_stmt)
        sqls.append("GO\n")

    # ---------- 1. 读取 Excel ----------
    sheets = pd.ExcelFile(excel_file, engine="openpyxl")
    columns, tables = {}, defaultdict(list)

    if "Columns" in sheets.sheet_names:
        df = pd.read_excel(sheets, "Columns", dtype=str).fillna({"control":"TextBox"}).fillna("")
        for row in df.to_dict(orient="records"):
            row = {k.strip(): v for k,v in row.items() if v != ""}
            if row.get("code"): columns[row["code"]] = row

    if "Tables" in sheets.sheet_names:
        df = pd.read_excel(sheets, "Tables", dtype=str).fillna("")
        df = df[df['table_code'].notna() & (df['table_code'].str.strip()!="")]
        for row in df.to_dict(orient="records"):
            row = {k.strip():v for k,v in row.items() if v != ""}
            table_code, col_code = row["table_code"], row["column"]
            base_col = columns.get(col_code, {}).copy()
            merged_col = {**base_col, **row}
            if row.get("name"): merged_col["column"] = row["name"]
            merged_col["pk"] = parse_bool(row.get("ispk",0))
            tables[table_code].append(merged_col)

    # ---------- 2. 读取 Constraints & Functions ----------
    with open(constraints_file, "r", encoding="utf-8") as f:
        constraints = yaml.safe_load(f)
    with open(functions_file, "r", encoding="utf-8") as f:
        functions = yaml.safe_load(f)

    # # ---------- 3. 导出 JSON ----------
    # with open(json_out, "w", encoding="utf-8") as f:
    #     json.dump({"columns":columns,"tables":dict(tables),
    #                "constraints":constraints,"functions":functions},
    #               f, ensure_ascii=False, indent=4, default=json_converter)

    # ---------- 4. 生成 SQL ----------
    sqls = []

    # --- 建表 ---
    for tbl, rows in tables.items():
        col_defs, pk_cols = [], []
        for r in rows:
            col_name = r.get("code", r["column"])
            col_type = type_with_length(r.get("type","VARCHAR"), r.get("length",""))
            segs = [bracket(col_name), col_type]
            if parse_bool(r.get("identity", False)): segs.append("IDENTITY(1,1)")
            nullable = str(r.get("nullable","")).lower()
            segs.append("NOT NULL" if parse_bool(r.get("pk", False)) or "false" in nullable else "NULL")
            if r.get("default"):
                lit = sql_lit_default(r["default"], col_type.startswith(("CHAR","NCHAR","VARCHAR","NVARCHAR")))
                if lit: segs.append(f"CONSTRAINT {bracket(f'DF_{tbl}_{col_name}')} DEFAULT {lit}")
            if parse_bool(r.get("pk", False)): pk_cols.append(bracket(col_name))
            col_defs.append(" ".join(segs))
        if tbl=="md_Organization": col_defs += ["[Emp1] INT NULL","[OrderBy] INT NULL"]
        pk_clause = f",\n    CONSTRAINT {bracket(f'PK_{tbl}')} PRIMARY KEY CLUSTERED ({', '.join(pk_cols)} ASC)" if pk_cols else ""
        full_table = bracket(tbl)
        sqls.append(f"IF OBJECT_ID(N'{full_table}',N'U') IS NOT NULL\n    DROP TABLE {full_table};\nGO\n"
                    f"CREATE TABLE {full_table} (\n    "+",\n    ".join(col_defs)+pk_clause+"\n);\nGO\n")

    # --- 索引/约束 ---
    for tbl in constraints.get("meta",{}).get("settings",[]):
        tname, full_table = tbl["table"], bracket(tbl["table"])
        for cons in tbl.get("constraints",[]):
            ctype, cols = cons.get("type","").upper(), cons.get("columns",[])
            cols_str = ", ".join(bracket(c) for c in cols)
            name = cons.get("name") or (("UQ" if ctype=="UNIQUE" else "IX")+f"_{tname}_{'_'.join(cols)}")
            if ctype=="UNIQUE":
                sqls.append(f"ALTER TABLE {full_table} ADD CONSTRAINT {bracket(name)} UNIQUE ({cols_str});\nGO\n")
            elif ctype=="INDEX":
                sqls.append(f"CREATE NONCLUSTERED INDEX {bracket(name)} ON {full_table} ({cols_str});\nGO\n")

    # --- Functions ---
    mapping = {"创建":1,"变更":2,"失效":3,"合并":4}
    for f in functions["functions"]:
        fid, code, title, table = f.get("id"), f.get("code"), f.get("name"), f.get("table")
        table_cols = [c.get("code", c.get("column")) for c in tables.get(table,[])]
        conditions = []
        if "历史" in title and "Closed" in table_cols: conditions.append("a.Closed = 1")
        if "历史" not in title:
            for k,v in mapping.items():
                if k in title and "OperType" in table_cols:
                    conditions.append(f"a.OperType = {v}"); break
            if "Closed" in table_cols: conditions.append("a.Closed = 0")
        datasource = f"SELECT a.*\nFROM {table} a" + ("\nWHERE " + "\n  AND ".join(conditions) if conditions else "")
        add_new_fields = []
        update_fields = []
        if "RegBy" in table_cols and "历史" not in title:
            oper_val = next((v for k,v in mapping.items() if k in title), None)
            if oper_val: add_new_fields.append(f"{oper_val} AS OperType")
            add_new_fields += ["${P_USERID} AS RegBy","GETDATE() AS RegTime"]
            add_new_fields += [f"0 AS {f}" for f in ["Closed","Canceled","Offered","Submit"] if f in table_cols]
            update_fields = ["${P_USERID} AS RegBy","GETDATE() AS RegTime"]
        add_new = "SELECT "+", ".join(add_new_fields) if add_new_fields else "NULL"
        update = "SELECT "+", ".join(update_fields) if update_fields else "NULL"
        write_block(f"DELETE FROM mc_Functions WHERE ID='{fid}';",
                    f"INSERT INTO mc_Functions(ID,Code,Title,DataSource,AddNewScript,UpdateScript)\n"
                    f"VALUES('{fid}','{code}',N'{title}','{datasource}','{add_new}','{update}');")

    # --- Tools ---
    attr_map = {"execsp":"<tool>...</tool>","popapp":"<tool>...</tool>"}
    for f in functions["functions"]:
        fid = f.get("id")
        for t in f.get("tools",[]):
            write_block(f"DELETE FROM mc_FunctionTools WHERE FCID='{fid}';",
                        f"INSERT INTO mc_FunctionTools(FCID,TBKey,Title,xType,xOrder,LayoutType,Attribute)\n"
                        f"VALUES('{fid}','{t.get('code')}',N'{t.get('name')}','{t.get('type')}',{t.get('xorder')},'table','{attr_map.get(t.get('type'),'NULL')}');")

    # --- FunctionCols ---
    datetype_map = {"INT": "Integer", "DATETIME": "DateTime", "DATE": "DateTime", "DECIMAL": "Number", "BIT": "Boolean", "VARCHAR": "String", "NVARCHAR": "String"}
    for f in functions["functions"]:
        fid, table_name = f.get("id"), f.get("table")
        for idx, col in enumerate(tables.get(table_name,[]),start=1):
            col_code = col.get("column")
            if not col_code: continue
            col_base = columns.get(col_code,{})
            col_type = col_base.get("type","VARCHAR").upper()
            length = col_base.get("length","")
            scale = col_base.get("scale","NULL")
            control = col_base.get("control","TextBox")
            max_length = length or 255
            datetype = datetype_map.get(col_type,"String")
            hidden = parse_bool(col.get("hidden",True))
            nullable = parse_bool(col.get("nullable",True))
            locked = parse_bool(col.get("locked",False))
            data_format = "yyyy-MM-dd HH:mm" if col_type.upper() == "DATETIME" else "yyyy-MM-dd" if col_type.upper() == "DATE" else  ""

            attribute = f"""<col>
  <datatype>{datetype}</datatype>
  <hidden>{1 if hidden else 0}</hidden>
  <formhidden>0</formhidden>
  <notnull>{0 if nullable else 1}</notnull>
  <control>{control}</control>
  {f'<format>{data_format}</format>' if data_format else ''}
  <locked>{1 if locked else 0}</locked>
</col>"""
            sqls.append(f"INSERT INTO mc_FunctionCols(FCID,Title,ColName,ObjAlias,ColKey,IsPKey,IsIdentity,MaxLength,Scale,xOrder,Attribute)\n"
                        f"VALUES('{fid}',N'{col_code}','{col_code}','a','{col_code}',0,0,{max_length},{scale},{idx},'{attribute}');")
        sqls.append("GO\n")

    # ---------- 5. 写入文件 ----------

    with open("configs/system_init.sql","w",encoding="utf-8") as f:
        f.write("\n".join(sqls))

    print(f"生成完成: {json_out} 和 {sql_out}")

# ---------- 使用示例 ----------
if __name__ == "__main__":
    gen_sql_scripts("configs/configs.xlsx", "configs/constraints.yaml", "configs/functions.yaml")
