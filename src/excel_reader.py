import pandas as pd
from collections import defaultdict

from src.utils import parse_bool


def read_columns(excel_file):
    sheets = pd.ExcelFile(excel_file, engine="openpyxl")
    columns = {}
    if "Columns" in sheets.sheet_names:
        df = pd.read_excel(sheets, "Columns", dtype=str).fillna({"control": "TextBox"}).fillna("")
        columns = {
            row["code"].strip(): {k.strip(): v for k, v in row.items() if v != ""}
            for row in df.to_dict(orient="records")
            if row.get("code")
        }
    return columns

def read_tables(excel_file):
    sheets = pd.ExcelFile(excel_file, engine="openpyxl")
    tables = []
    if "Tables" in sheets.sheet_names:
        df = pd.read_excel(sheets, "Tables", dtype=str).fillna("")
        for row in df.to_dict(orient="records"):
            row = {k.strip(): v for k, v in row.items() if v != ""}
            if row.get("table_name"):
                row["change_types"] = [x.strip() for x in (row.get("change_type") or "").split(",") if x.strip()]
                tables.append(row)
    return tables

def read_table_columns(excel_file, columns=None):
    sheets = pd.ExcelFile(excel_file, engine="openpyxl")
    table_columns = defaultdict(list)

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
        return table_columns