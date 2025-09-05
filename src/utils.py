import hashlib
import datetime
from decimal import Decimal

# ---------- JSON 序列化 ----------
def json_converter(o):
    if isinstance(o, (datetime.date, datetime.datetime)):
        return o.isoformat()
    if isinstance(o, Decimal):
        return float(o)
    return str(o)

# ---------- 截断名称 ----------
def truncate_name(name, max_len=128):
    """如果 name 超过 max_len，截断并加 8 位哈希保证唯一性"""
    if len(name) <= max_len:
        return name
    # 取前 max_len-9 个字符 + '_' + 8 位 hash
    hash_suffix = hashlib.md5(name.encode("utf-8")).hexdigest()[:8]
    return name[:max_len - 9] + "_" + hash_suffix

# ---------- 布尔解析 ----------
def parse_bool(val): return str(val).strip().lower() in {"1","true","y","yes","是"}

def bracket(name): return f"[{name}]"

def bool_to_int(val):
    """
    将布尔值或空值转换为 0/1
    True -> 1, False/None/"" -> 0
    """
    if isinstance(val, str):
        val = val.strip().lower() in {"1", "true", "yes", "y", "是"}
    return 1 if val else 0

def build_script(fields: list):
    """根据字段列表生成 SELECT 语句，如果为空返回 NULL"""
    if not fields:
        return "NULL"
    return f"'SELECT {', '.join(fields)}'"