import pandas as pd
import json

def load_excel(file_path):
    excel_data = pd.ExcelFile(file_path, engine="openpyxl")
    result = {}

    for sheet in excel_data.sheet_names:
        df = (
            pd.read_excel(file_path, sheet_name=sheet, dtype=str)   # 所有列都为 string 类型
            .fillna({"control": "TextBox"}) # control默认值为输入框
            .fillna("") # 其他列默认值为空
        )

        # 转 dict & 去掉空 key
        rows = [
            {k: v for k, v in row.items() if v != ""}
            for row in df.to_dict(orient="records")
        ]
        rows = list({frozenset(r.items()): r for r in rows}.values())

        result[sheet] = rows
    return result

if __name__ == "__main__":
    excel_file = "configs/configs.xlsx"
    data_dict = load_excel(excel_file)

    # 转成 JSON 字符串
    json_str = json.dumps(data_dict, ensure_ascii=False, indent=2)
    print(json_str)

    # 如果需要写入文件
    with open("configs/configs.json", "w", encoding="utf-8") as f:
        f.write(json_str)
