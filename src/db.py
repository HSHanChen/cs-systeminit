import pyodbc
import re

def get_connection(server, database, username, password, driver="{ODBC Driver 17 for SQL Server}"):
    return pyodbc.connect(
        f'DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password}'
    )

def execute_sql_file(conn, sql_file):
    with open(sql_file, "r", encoding="utf-8") as f:
        sql_script = f.read()
    statements = re.split(r'^\s*GO\s*;?\s*$', sql_script, flags=re.MULTILINE | re.IGNORECASE)
    cursor = conn.cursor()
    try:
        for stmt in statements:
            stmt = stmt.strip()
            if not stmt:
                continue
            try:
                cursor.execute(stmt)
            except pyodbc.Error as e:
                print("执行出错，SQL 片段：\n", stmt)
                print("错误信息：", e)
                raise e

        conn.commit()
        print("SQL 文件执行完成！")
    except Exception as e:
        print("执行出错，已回滚：", e)
        conn.rollback()
        raise
    finally:
        cursor.close()
