import json
from .utils import json_converter

def export_json(json_path, columns, tables, table_columns, constraints, functions, applications):
    data = {
        "columns": columns,
        "tables": tables,
        "table_columns": dict(table_columns),
        "constraints": constraints,
        "functions": functions,
        "applications": applications
    }
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=4, default=json_converter)
