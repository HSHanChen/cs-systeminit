from src.utils import parse_bool, bool_to_int


def generator_function_sql(columns, tables, table_columns, functions, table_all_columns):
    oper_map = {"创建": 1, "变更": 2, "失效": 3, "合并": 4}
    funcs = functions.get("functions")
    sqls = []
    for func in funcs:
        # 获取功能ID、功能Code 功能名称 功能对应的表
        func_id, func_code, func_name, func_table, func_params = func.get("id"), func.get("code"), func.get("name"), func.get("table"), func.get("params", [])
        cols_for_func = table_all_columns.get(func_table, [])

        if not cols_for_func:
            # 如果表里没有字段，用 Table_Columns 的配置取列名
            cols_for_func = [c.get("column") for c in table_columns.get(func_table, [])]
        # 获取对应表的所有字段
        cols = table_columns.get(func_table, [])
        table_cols = {c.get("code") or c.get("column") for c in cols}

        # 构建数据源条件
        conditions = []
        if "历史" in func_name and "Closed" in table_cols: conditions.append("a.Closed = 1")
        if "历史" not in func_name:
            for k, v in oper_map.items():
                if k in func_name and "OperType" in table_cols:
                    conditions.append(f"a.OperType = {v}");
                    break
            if "Closed" in table_cols: conditions.append("a.Closed = 0")

        base_where = "\n  AND ".join(conditions) if conditions else ""

        # 遍历功能参数，收集非空条件
        param_conditions = [fp.get("condition") for fp in func_params if fp.get("condition")]

        # 合并所有条件
        if base_where:
            conditions.append(base_where)
        if param_conditions:
            conditions.extend(param_conditions)

        # 数据源
        datasource = f"SELECT a.*\nFROM {func_table} a"
        if conditions:
            datasource += "\nWHERE " + "\n  AND ".join(conditions)

        def build_script(fields: list):
            """根据字段列表生成 SELECT 语句，如果为空返回 NULL"""
            if not fields:
                return "NULL"
            return f"'SELECT {', '.join(fields)}'"

        # ---- 新增、修改脚本 ----
        add_new_fields, update_fields = [], []
        if "RegBy" in table_cols and "历史" not in func_name:
            # OperType
            oper_val = next((v for k, v in oper_map.items() if k in func_name), None)
            if oper_val is not None and "OperType" in table_cols:
                add_new_fields.append(f"{oper_val} AS OperType")

            # 通用字段
            add_new_fields += ["${P_USERID} AS RegBy", "GETDATE() AS RegTime"]
            add_new_fields += [f"0 AS {f}" for f in ["Closed", "Canceled", "Offered", "Submit", "Rejected"] if f in table_cols]

            update_fields = ["${P_USERID} AS RegBy", "GETDATE() AS RegTime"]

        # 生成 SQL，可直接用于 INSERT VALUES
        add_scripts = build_script(add_new_fields)
        update_scripts = build_script(update_fields)

        # ---- 生成 INSERT INTO mc_Functions SQL ----
        functions_sql = (
            f"DELETE FROM mc_Functions WHERE ID = '{func_id}';\n"
            f"INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)\n"
            f"VALUES('{func_id}', '{func_code}', N'{func_name}', '{datasource}', {add_scripts}, {update_scripts});\nGO\n"
        )
        sqls.append(functions_sql)

        # --- FunctionParams ---
        sqls.append(f"DELETE FROM mc_FunctionParams WHERE FCID = '{func_id}';\n")
        # 遍历功能参数表，如有，则在 conditions 后面拼接，需判断 conditions 有没有 WHERE 条件
        for fp in func_params:
            fp_code = fp.get("code")
            fp_title = fp.get("title")
            fp_datetype = fp.get("datetype")
            fp_notnull = fp.get("notnull")
            fp_default = fp.get("default")
            fp_control = fp.get("control")
            fp_xorder = fp.get("xorder", 1)
            fp_format = "yyyy-MM-dd" if fp_datetype == "DateTime" else ""
            attr_parts = [
                f"<param>",
                f"  <datatype>{fp_datetype}</datatype>",
                f"  <hidden>0</hidden>",
                f"  <gridhidden>0</gridhidden>",
                f"  <formhidden>0</formhidden>",
                f"  <notnull>{fp_notnull}</notnull>",
                f"  <control>{fp_control}</control>"
            ]
            if fp_format:
                attr_parts.append(f"  <format>{fp_format}</format>")
            if fp_default:
                attr_parts.append(f"  <defval><![CDATA[{fp_default}]]></defval>")
            attr_parts.extend([f"</param>"])
            fp_attr = "\n".join(attr_parts)
            fp_sql = (
                f"INSERT INTO mc_FunctionParams(FCID, Code, Title, xOrder, Attribute)\n"
                f"VALUES('{func_id}','{fp_code}',N'{fp_title}',{fp_xorder},'{fp_attr}');\nGO\n"
            )
            sqls.append(fp_sql)

        # --- FunctionTools ---
        # 删除旧数据
        sqls.append(f"DELETE FROM mc_FunctionTools WHERE FCID='{func_id}';\nGO\n")
        tool_attr_map = {
            "execsp": """<tool>
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
    </tool>""",
            "popapp": """<tool>
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
        length_map = {"INT": 8, "BIGINT": 16, "DATETIME": 8, "DATE": 8, "BIT": 1}
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
            if not col_cfg_table: continue

            # Columns 配置
            col_cfg_base = columns.get(base_col_name, {})

            # 类型、长度、scale、control 从 Columns 里取
            col_type = col_cfg_base.get("type", "VARCHAR").upper()
            datetype = func_cols_map.get(col_type, "String")
            max_length = length_map.get(col_type, col_cfg_base.get("length")) or "NULL"
            scale = col_cfg_base.get("scale") or "NULL"
            control = col_cfg_base.get("control") or "TextBox"
            source = col_name if "Single" in control else ""

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

            attr_parts = [
                f"<col>",
                f"  <datatype>{datetype}</datatype>",
                f"  <hidden>{hidden}</hidden>",
                f"  <gridhidden>{grid_hidden}</gridhidden>",
                f"  <formhidden>{form_hidden}</formhidden>",
                f"  <notnull>{nullable}</notnull>",
                f"  <control>{control}</control>"
            ]

            if source:
                attr_parts.append(f"  <source>![CDATA[{source}]]</source>")
            if data_format:
                attr_parts.append(f"  <format>{data_format}</format>")

            attr_parts.extend([
                f"  <uploadtype>1</uploadtype>",
                f"  <locked>1</locked>",
                f"  <crypt>0</crypt>",
                f"  <importkey>0</importkey>",
                f"  <importval>0</importval>",
                f"  <logupdatecondition>0</logupdatecondition>",
                f"  <logupdatecolumn>0</logupdatecolumn>",
                f"  <searchable>0</searchable>",
                f"  <empbadge>0</empbadge>",
                f"</col>"
            ])
            col_attr = "\n".join(attr_parts)

            insert_sql = f"('{func_id}', N'{col_title}', '{col_name}', 'a', '{col_name}', {is_pkey}, {is_identity}, {max_length}, {scale}, {order_no}, '{col_attr}')"

            insert_values.append(insert_sql)

        if insert_values:
            func_col_sql = (
                    "Insert Into Mc_Functioncols(Fcid, Title, Colname, Objalias, Colkey, Ispkey, Isidentity, Maxlength, Scale, Xorder, Attribute)\nValues\n"
                    + ",\n".join(insert_values) + ";\nGo\n"
            )

            # 拼接完整 INSERT 语句
            sqls.append(func_col_sql)