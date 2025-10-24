# 夏令时爵士乐队网站 - Docker 配置
FROM python:3.11-slim

WORKDIR /app

# 安装依赖
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# 复制应用文件
COPY . .

# 暴露端口
EXPOSE 8080

# 使用 Gunicorn 运行
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8080", "app:app"]
