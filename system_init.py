"""
@Author: Chan Sheen
@Date: 2025/9/1 17:49
@File: system_init.py
@Description: 
"""
import hashlib
import re
import pandas as pd
import yaml
import json
from collections import defaultdict
from decimal import Decimal
import datetime

from django.template.defaultfilters import length
from django.urls import include
from numpy.ma.extras import unique
from tinycss2.nth import parse_b


# ---------- JSON 序列化 ----------
def json_converter(o):
    if isinstance(o, (datetime.date, datetime.datetime)):
        return o.isoformat()
    if isinstance(o, Decimal):
        return float(o)
    return str(o)

# ---------- 约束、索引长度限制 ----------
def truncate_name(name, max_len=128):
    """如果 name 超过 max_len，截断并加 8 位哈希保证唯一性"""
    if len(name) <= max_len:
        return name
    # 取前 max_len-9 个字符 + '_' + 8 位 hash
    hash_suffix = hashlib.md5(name.encode("utf-8")).hexdigest()[:8]
    return name[:max_len - 9] + "_" + hash_suffix

# ---------- 统一生成器 ----------
def gen_sql_scripts(
        excel_file,
        constraints_file,
        functions_file,
        json_out="configs.json",
        sql_out="system_init.sql"
):
    def bool_to_int(val):
        """
        将布尔值或空值转换为 0/1
        True -> 1, False/None/"" -> 0
        """
        if isinstance(val, str):
            val = val.strip().lower() in {"1", "true", "yes", "y", "是"}
        return 1 if val else 0


    constraint_max_length = 128

    # ---------- 工具函数 ----------
    def bracket(name): return f"[{name}]"

    def parse_bool(val): return str(val).strip().lower() in {"1","true","y","yes","是"}

    # ---------- 字段长度格式 ----------
    def type_with_length(col_type, length="", scale=""):
        col_type = (col_type or "").upper()
        length = str(length or "").strip()
        scale = str(scale or "").strip()

        if col_type in ("DECIMAL", "NUMERIC"):
            if length and scale:
                return f"{col_type}({length},{scale})"
            elif length:
                return f"{col_type}({length})"
            else:
                return col_type
        else:
            if length:
                return f"{col_type}({length})"
            else:
                return col_type

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

    columns, tables, table_columns = {}, [], defaultdict(list)

    # ---------- 读取 Columns ----------
    if "Columns" in sheets.sheet_names:
        df = pd.read_excel(sheets, "Columns", dtype=str).fillna({"control":"TextBox"}).fillna("")
        for row in df.to_dict(orient="records"):
            row = {k.strip(): v for k,v in row.items() if v != ""}
            if row.get("code"): columns[row["code"]] = row

    # ---------- 读取 Tables ----------
    if "Tables" in sheets.sheet_names:
        df = pd.read_excel(sheets, "Tables", dtype=str).fillna("")
        tables = []
        for row in df.to_dict(orient="records"):
            row = {k.strip(): v for k, v in row.items() if v != ""}
            table_name = row.get("table_name")
            if not table_name:
                continue
            ct = row.get("change_type", "")
            row["change_types"] = [x.strip() for x in ct.split(",") if x.strip()] if ct else []
            tables.append(row)

    # ---------- 读取 Table_Columns ----------
    if "Table_Columns" in sheets.sheet_names:
        df = pd.read_excel(sheets, "Table_Columns", dtype=str).fillna("")
        for row in df.to_dict(orient="records"):
            # 去掉空字符串
            row = {k.strip(): v for k, v in row.items() if v != ""}

            table_name, col_code = row.get("table_name"), row.get("column")
            if not table_name or not col_code:
                continue

            # 取 Columns 中的基础定义
            base_col = columns.get(col_code, {}).copy()

            # 合并 Table_Columns 中的定义
            merged_col = {**base_col, **row}

            # column 使用英文列明
            merged_col["column"] = merged_col.get("column") or merged_col.get("code")

            # name 优先取 Table_Columns 的值，如果没有就取 Columns 的值
            merged_col["name"] = row.get("name") or base_col.get("name") or merged_col["column"]

            # 布尔化
            merged_col["pk"] = parse_bool(merged_col.get("ispk", False))
            merged_col["identity"] = parse_bool(merged_col.get("identity", False))
            merged_col["nullable"] = parse_bool(merged_col.get("nullable", True))

            # 追加到 table_columns
            table_columns[table_name].append(merged_col)

    # ---------- 2. 读取 Constraints & Functions ----------
    with open(constraints_file, "r", encoding="utf-8") as f:
        constraints = yaml.safe_load(f)
    with open(functions_file, "r", encoding="utf-8") as f:
        functions = yaml.safe_load(f)

    # ---------- 3. 导出 JSON ----------
    with open(json_out, "w", encoding="utf-8") as f:
        json.dump({
            "columns":columns,
            "tables":tables,
            "table_columns":dict(table_columns),
            "constraints":constraints,
            "functions":functions
        },f, ensure_ascii=False, indent=4, default=json_converter)

    # ---------- 4. 生成 SQL ----------
    sqls = []
    table_all_columns = {}
    # 遍历表
    for table in tables:
        table_name = table["table_name"]
        cols = table_columns.get(table_name, [])
        is_changed = parse_bool(table.get("is_changed"))
        change_type = table.get("change_type")

        # 遍历字段
        col_sqls = []
        pk_cols = []
        for col in cols:
            col_name = col.get("column")

            # 类型 + 长度 + scale
            col_type = type_with_length(
                col.get("type", "VARCHAR"),
                col.get("length", ""),
                col.get("scale", "")
            )

            #自增
            identity = "IDENTITY(1,1)" if parse_bool(col.get("identity", False)) else ""

            # 主键
            if col.get("ispk"):
                nullable = "NOT NULL"
                pk_cols.append(col_name)
            else:
                if col.get("nullable") is None:  # 没有配置 nullable
                    nullable = "NULL"
                elif parse_bool(col.get("nullable")):
                    nullable = "NULL"
                else:
                    nullable = "NOT NULL"

            # 判断是否需要 Old_XXX 字段
            if is_changed:
                # 把 change_type 逗号拆分开为列表
                change_types = [x.strip() for x in change_type.split(",") if x.strip()]
                col_cfg = columns.get(col_name, {})
                if col_cfg:
                    col_changetype = col_cfg.get("changetype", "").strip()
                    if col_changetype and col_changetype in change_types:
                        old_col_name = f"Old_{col_cfg['code']}"
                        old_col_type = type_with_length(col_cfg.get("type", "VARCHAR"), col_cfg.get("length", ""), col_cfg.get("scale", ""))
                        old_scale = col_cfg.get("scale", "")
                        if old_scale:
                            old_col_type += f"({old_scale})"
                        col_sqls.append(f"[{old_col_name}] {old_col_type} NULL")

            col_line = f"[{col_name}] {col_type} {identity} {nullable}".strip()
            col_sqls.append(col_line)

        # 特殊表处理，系统必须要有这几个字段
        if table_name == "md_Organization":
            extra_cols = {
                "Emp1": "[Emp1] INT NULL",
                "OrderBy": "[OrderBy] INT NULL",
                "Disabled": "[Disabled] BIT NULL"
            }
            existing_cols = {c.split()[0].strip("[]") for c in col_sqls}  # 已有列名集合
            for col_name, col_def in extra_cols.items():
                if col_name not in existing_cols:  # 避免重复
                    col_sqls.append(col_def)

        table_all_columns[table["table_name"]] = [c.split()[0].strip("[]") for c in col_sqls]

        # 主键
        pk_sql = ""
        if pk_cols: pk_sql = f",\n    CONSTRAINT {bracket(f'PK_{table_name}')} PRIMARY KEY CLUSTERED ({', '.join(pk_cols)} ASC)"

        # UNIQUE 约束
        unique_sqls = []
        index_sqls = []
        tbl_constraints = next(
            (item.get("constraints", []) for item in constraints.get("meta", {}).get("settings", [])
             if item.get("table") == table_name),
            []
        )
        for constraint in tbl_constraints:
            ctype, cols, cname, has_include = constraint.get("type", "").upper(), constraint.get("columns", ""), constraint.get("name"), constraint.get("include")
            cols_str = ", ".join(bracket(c) for c in cols)
            include_cols = ", ".join(bracket(c) for c in has_include) if has_include else ""
            if not ctype: continue
            if not cname: cname = (("UQ" if ctype == "UNIQUE" else "IX") + f"_{table_name}_{'_'.join(cols)}")
            cname = truncate_name(cname, constraint_max_length)
            # 唯一约束
            if ctype == "UNIQUE":
                unique_sqls.append(f"CONSTRAINT {bracket(cname)} UNIQUE ({', '.join(cols)})")

            elif ctype == "INDEX":
                index_sqls.append(
                    f"CREATE NONCLUSTERED INDEX {bracket(cname)} ON {table_name} ({cols_str})"
                    + (f" INCLUDE({include_cols})" if has_include else "")
                    + ";\nGO\n"
                )

        # ---------- CREATE TABLE ----------
        sqls.append(
            f"IF OBJECT_ID(N'{table_name}',N'U') IS NOT NULL\n    DROP TABLE {table_name};\nGO\n"
            f"CREATE TABLE {table_name} (\n    " +
            ",\n    ".join(col_sqls) +  # 列定义
            pk_sql +  # 主键约束
            (",\n    " + ",\n    ".join(unique_sqls) if unique_sqls else "") +  # UNIQUE 约束
            "\n);\nGO\n"
        )

        # 索引构建
        sqls.append("\n".join(index_sqls))

    # --- Functions ---
    oper_map = {"创建": 1, "变更": 2, "失效": 3, "合并": 4}
    funcs = functions.get("functions")
    # 遍历 functions
    for func in funcs:
        # 获取功能ID、功能Code 功能名称 功能对应的表
        func_id, func_code, func_name, func_table = func.get("id"), func.get("code"), func.get("name"), func.get("table")
        cols_for_func = table_all_columns.get(func_table, [])
        # 获取对应表的所有字段
        cols = table_columns.get(func_table, [])
        table_cols = {c.get("code") or c.get("column") for c in cols}
        # 构建数据源条件
        conditions = []
        if "历史" in func_name and "Closed" in table_cols: conditions.append("a.Closed = 1")
        if "历史" not in func_name:
            for k, v in oper_map.items():
                if k in func_name and "OperType" in table_cols:
                    conditions.append(f"a.OperType = {v}"); break
            if "Closed" in table_cols: conditions.append("a.Closed = 0")
        # 数据源
        datasource = f"SELECT a.*\nFROM {func_table} a" + ("\nWHERE " + "\n  AND ".join(conditions) if conditions else "")

        # 新增、修改脚本
        add_new_fields, update_fields = [], []
        if "RegBy" in table_cols and "历史" not in func_name:
            oper_val = next((v for k, v in oper_map.items() if k in func_name), None)
            if oper_val is not None and "OperType" in table_cols:
                add_new_fields.append(f"{oper_val} AS OperType")
            add_new_fields += ["${P_USERID} AS RegBy", "GETDATE() AS RegTime"]
            add_new_fields += [f"0 AS {f}" for f in ["Closed","Canceled","Offered","Submit"] if f in table_cols]
            update_fields = ["${P_USERID} AS RegBy", "GETDATE() AS RegTime"]
        add_scripts = "SELECT " + ", ".join(add_new_fields) if add_new_fields else "NULL"
        update_scripts = "SELECT " + ", ".join(update_fields) if update_fields else "NULL"

        # ---- 生成 INSERT INTO mc_Functions SQL ----
        functions_sql = (
            f"DELETE FROM mc_Functions WHERE ID = '{func_id}';\n"
            f"INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)\n"
            f"VALUES('{func_id}','{func_code}',N'{func_name}','{datasource}','{add_scripts}','{update_scripts}');\nGO\n"
        )
        sqls.append(functions_sql)

        # --- FunctionTools ---
        # 删除旧数据
        sqls.append(f"DELETE FROM mc_FunctionTools WHERE FCID='{func_id}';\nGO\n")
        tool_attr_map = {"execsp": """<tool>
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
</tool>""", "popapp": """<tool>
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
</tool>"""}
        for tool in func.get("tools", []):
            tool_code, tool_name, tool_type, tool_xorder = tool.get("code"), tool.get("name"), tool.get("type"), tool.get("xorder")
            tool_attr = tool_attr_map.get(tool_type, 'NULL')
            func_tool_sql = (
                f"INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)\n"
                f"VALUES({func_id}, '{tool_code}', N'{tool_name}', '{tool_type}', {tool_xorder}, 'table', '{tool_attr}')\nGO\n")
            sqls.append(func_tool_sql)

        # --- FunctionCols ---
        sqls.append(f"DELETE FROM mc_FunctionCols WHERE FCID ='{func_id}';\nGO\n")
        func_cols_map = {"INT": "Integer", "DATETIME": "DateTime", "DATE": "DateTime", "DECIMAL": "Number", "BIT": "Boolean", "VARCHAR": "String",
                         "NVARCHAR": "String"}
        length_map = {"INT":8, "BIGINT": 16, "DATETIME": 8, "DATE": 8, "BIT": 1}
        insert_values = []
        for idx, func_col in enumerate(cols_for_func, start=1):
            col_name = func_col.strip("[]")
            if col_name in ["Title1", "Title2", "Title3", "Title4", "Title5", "Old_Title1", "Old_Title2", "Old_Title3", "Old_Title4", "Old_Title5"]:
                continue
            is_old = col_name.startswith("Old_")
            base_col_name = col_name[4:] if is_old else col_name
            tbl = next((t for t in tables if t.get("table_name") == func_table), {})
            is_changed = parse_bool(tbl.get("is_changed", False))
            order_no = idx

            # 条件判断是否插入 Old_ 字段
            if is_old:
                insert_old = False
                if is_changed and ("变更" in func_name or "变动" in func_name):
                    insert_old = True
                elif "操作历史" in func_name:
                    insert_old = True
                if not insert_old:
                    continue

            # Table_Columns 配置
            col_cfg_table = next((c for c in table_columns.get(func_table, []) if c.get("column") == base_col_name), {})

            # Columns 配置
            col_cfg_base = columns.get(base_col_name, {})

            # 类型、长度、scale、control 从 Columns 里取
            col_type = col_cfg_base.get("type", "VARCHAR").upper()
            datetype = func_cols_map.get(col_type, "String")
            max_length = length_map.get(col_type, col_cfg_base.get("length")) or "NULL"
            scale = col_cfg_base.get("scale") or "NULL"
            control = col_cfg_base.get("control") or "TextBox"

            # 名称、identity、ispk、nullable、locked、hidden、form_hidden、grid_hidden 从 Table_Columns
            col_title = col_cfg_table.get("name") or col_cfg_base.get("name") or base_col_name
            is_identity = 1 if col_cfg_table.get("identity") else 0
            is_pkey = 1 if col_cfg_table.get("ispk") else 0
            nullable = 1 if col_cfg_table.get("nullable") else 0
            locked = 1 if col_cfg_table.get("locked") else 0
            hidden = bool_to_int(col_cfg_table.get("hidden"))
            form_hidden = 1 if col_cfg_table.get("form_hidden") else 0
            grid_hidden = 1 if col_cfg_table.get("grid_hidden") else 0
            data_format = "yyyy-MM-dd HH:mm" if col_type.upper() == "DATETIME" else "yyyy-MM-dd" if col_type.upper() == "DATE" else ""

            # Old_字段特殊处理
            if is_old:
                locked = 1
                hidden = form_hidden = grid_hidden = nullable = 0

            if is_old:
                col_title = f"原{col_title}"
                if is_changed and ("变更" in func_name or "变动" in func_name):
                    locked, grid_hidden = 1, 1
                elif "操作历史" in func_name:
                    locked, grid_hidden = 1, 0

            col_attr = f"""<col>
  <datatype>{datetype}</datatype>
  <hidden>{hidden}</hidden>
  <gridhidden>{grid_hidden}</gridhidden>
  <formhidden>{form_hidden}</formhidden>
  <notnull>{nullable}</notnull>
  <control>{control}</control>
  <format>{f'<format>{data_format}</format>' if data_format else ''}</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>"""
            insert_sql = f"('{func_id}', N'{col_title}', '{col_name}', 'a', '{col_name}', {is_pkey}, {is_identity}, {max_length}, {scale}, {order_no}, '{col_attr}')"
            insert_values.append(insert_sql)

            # # 构建 INSERT SQL
            # insert_sql = (
            #     f"('{func_id}', N'{col_title}', '{col_name}', 'a', '{col_name}', {is_pkey}, {is_identity}, {max_length}, {scale}, {order_no}, '{col_attr}'),\n"
            # )
            # 拼接完整 INSERT
            sqls.append(
                "INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)\nVALUES\n"
                + ",\n".join(insert_values) + ";\nGO\n"
            )

    with open("sql_out.sql", "w", encoding="utf-8") as f:
        f.write("\n".join(sqls))

#
#     # --- FunctionCols ---
#     datetype_map = {"INT": "Integer", "DATETIME": "DateTime", "DATE": "DateTime", "DECIMAL": "Number", "BIT": "Boolean", "VARCHAR": "String", "NVARCHAR": "String"}
#     for f in functions["functions"]:
#         fid, table_name = f.get("id"), f.get("table")
#         for idx, col in enumerate(table_columns.get(table_name,[]),start=1):
#             col_code = col.get("column")
#             if not col_code: continue
#             col_base = columns.get(col_code,{})
#             col_type = col_base.get("type","VARCHAR").upper()
#             length = col_base.get("length","")
#             scale = col_base.get("scale","NULL")
#             control = col_base.get("control","TextBox")
#             max_length = length or 255
#             datetype = datetype_map.get(col_type,"String")
#             hidden = parse_bool(col.get("hidden",True))
#             nullable = parse_bool(col.get("nullable",True))
#             locked = parse_bool(col.get("locked",False))
#             data_format = "yyyy-MM-dd HH:mm" if col_type.upper() == "DATETIME" else "yyyy-MM-dd" if col_type.upper() == "DATE" else  ""
#
#             attribute = f"""<col>
#   <datatype>{datetype}</datatype>
#   <hidden>{1 if hidden else 0}</hidden>
#   <formhidden>0</formhidden>
#   <notnull>{0 if nullable else 1}</notnull>
#   <control>{control}</control>
#   {f'<format>{data_format}</format>' if data_format else ''}
#   <locked>{1 if locked else 0}</locked>
# </col>"""
#             sqls.append(f"INSERT INTO mc_FunctionCols(FCID,Title,ColName,ObjAlias,ColKey,IsPKey,IsIdentity,MaxLength,Scale,xOrder,Attribute)\n"
#                         f"VALUES('{fid}',N'{col_code}','{col_code}','a','{col_code}',0,0,{max_length},{scale},{idx},'{attribute}');")
#         sqls.append("GO\n")
#
#     # ---------- 5. 写入文件 ----------
#
#     with open("configs/system_init.sql","w",encoding="utf-8") as f:
#         f.write("\n".join(sqls))

    print(f"生成完成: {json_out} 和 {sql_out}")

# ---------- 使用示例 ----------
if __name__ == "__main__":
    gen_sql_scripts("configs/configs.xlsx", "configs/constraints.yaml", "configs/functions.yaml")
