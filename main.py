from src.excel_reader import read_columns, read_tables, read_table_columns
from src.yaml_reader import read_yaml
from src.json_exporter import export_json
from src.sql_generator import generate_create_table_sql, generator_function_sql, generator_application_sql
from src.db import get_connection, execute_sql_file

EXCEL_FILE = "configs/初始化配置.xlsx"
CONSTRAINTS_FILE = "configs/constraints.yaml"
FUNCTIONS_FILE = "configs/functions.yaml"
APPLICATIONS_FILE = "configs/applications.yaml"
SQL_OUT = "scripts/sql_statements.sql"
JSON_OUT = "scripts/configs.json"

if __name__ == "__main__":
    # 读取 Excel
    columns = read_columns(EXCEL_FILE)
    tables = read_tables(EXCEL_FILE)
    table_columns = read_table_columns(EXCEL_FILE, columns=columns)

    # 读取 YAML
    constraints = read_yaml(CONSTRAINTS_FILE)
    functions = read_yaml(FUNCTIONS_FILE)
    applications = read_yaml(APPLICATIONS_FILE)

    # 导出 JSON
    export_json(JSON_OUT, columns, tables, table_columns, constraints, functions, applications)

    # 生成 SQL
    sqls, table_all_columns = generate_create_table_sql(columns, tables, table_columns, constraints)
    sqls += generator_function_sql(columns, tables, table_columns, functions, table_all_columns)
    sqls += generator_application_sql(applications)

    with open(SQL_OUT, "w", encoding="utf-8") as f:
        f.write("\n".join(sqls))

    # 执行 SQL
    conn = get_connection("localhost", "JUSTIN", "sa", "123456")
    execute_sql_file(conn, SQL_OUT)
    conn.close()
