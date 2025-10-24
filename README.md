# 🎷 夏令时爵士乐队 - 乐谱分享网站

> Simple is better than complex.

https://daylight-saving-time-satellus-score-website-20251024-6vy4q7ol1.vercel.app

一个简洁的乐谱分享网站，用于记录和分享乐队排练过的曲目。

## 快速开始

### 1. 安装依赖

进入你的python虚拟环境中。如果你不知道什么是虚拟环境，请先学习虚拟环境是什么、如何配置虚拟环境。
```bash
pip install -r requirements.txt
```

### 2. 添加乐谱文件

将 PDF 格式的乐谱放入 `static/scores/` 目录。

### 3. 更新曲目信息

编辑 `songs.yaml` 文件，添加曲目信息：

```yaml
songs:
  - title: "曲名"
    composer: "作曲家"
    style: "风格"
    key: "调性"
    tempo: "速度"
    filename: "文件名.pdf"  # 必须和 static/scores/ 中的文件名一致
    rehearsal_date: "2024-10-24"
```

### 4. 运行网站

```bash
python app.py
```

访问 http://localhost:8080

## 项目结构

```
daylight-saving-time/
├── app.py              # Flask 主应用
├── songs.yaml          # 曲目元数据（手动编辑）
├── requirements.txt    # Python 依赖
├── static/
│   ├── scores/         # 存放乐谱 PDF 文件
│   └── style.css       # 样式表
└── templates/
    └── index.html      # 主页模板
```

## 设计哲学

遵循 **The Zen of Python**：

- ✅ **Explicit is better than implicit** - 所有配置在 YAML 中清晰可见
- ✅ **Simple is better than complex** - 单文件应用，无数据库
- ✅ **Readability counts** - 代码和配置一目了然
- ✅ **Flat is better than nested** - 扁平的目录结构

## 部署建议

### 本地使用
直接运行 `python app.py` 即可。

### 生产环境
使用 Gunicorn：

```bash
pip install gunicorn
gunicorn -w 4 -b 0.0.0.0:8080 app:app
```

## License

MIT
