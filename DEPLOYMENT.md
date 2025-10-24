# 夏令时爵士乐队网站 - 部署指南

## 方案一：本地/局域网部署（最简单）

适合乐队内部使用，不需要公网访问。

### 步骤：

1. **安装依赖**
```bash
pip install -r requirements.txt
```

2. **添加乐谱文件**
将 PDF 乐谱放入 `static/scores/` 目录

3. **运行网站**
```bash
python app.py
```

4. **访问**
- 本机访问：http://localhost:8080
- 局域网访问：http://你的IP地址:8080

### 查看本机 IP 地址：
```bash
# Windows
ipconfig

# 找到 IPv4 地址，例如：192.168.1.100
# 其他设备访问：http://192.168.1.100:8080
```

---

## 方案二：云服务器部署（推荐）

适合公网访问，任何人都能访问。

### 推荐平台：

#### 1. **Vercel**（免费，最简单）
- 免费额度充足
- 自动 HTTPS
- 全球 CDN

**部署步骤**：
```bash
# 1. 安装 Vercel CLI
npm install -g vercel

# 2. 登录
vercel login

# 3. 部署
vercel
```

#### 2. **Railway**（免费，适合 Flask）
- 免费 $5/月额度
- 支持 Python
- 自动部署

**部署步骤**：
1. 访问 https://railway.app
2. 连接 GitHub 仓库
3. 自动检测并部署

#### 3. **PythonAnywhere**（免费，专为 Python）
- 免费账户
- 适合 Flask 应用
- 简单易用

**部署步骤**：
1. 注册 https://www.pythonanywhere.com
2. 上传代码
3. 配置 Web 应用

#### 4. **阿里云/腾讯云**（国内访问快）
- 学生优惠
- 国内访问速度快
- 需要备案

---

## 方案三：Docker 部署

适合有 Docker 环境的服务器。

### 使用方法：

```bash
# 1. 构建镜像
docker build -t dst-band .

# 2. 运行容器
docker run -d -p 8080:8080 dst-band

# 3. 访问
http://服务器IP:8080
```

---

## 生产环境配置

### 使用 Gunicorn（推荐）

```bash
# 安装
pip install gunicorn

# 运行（4个工作进程）
gunicorn -w 4 -b 0.0.0.0:8080 app:app
```

### 使用 Nginx 反向代理

```nginx
server {
    listen 80;
    server_name yourdomain.com;

    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location /static {
        alias /path/to/your/app/static;
    }
}
```

---

## 域名配置

### 免费域名：
- **Freenom**：.tk, .ml, .ga 等免费域名
- **eu.org**：免费二级域名

### 付费域名：
- **阿里云**：.com 约 55元/年
- **腾讯云**：.com 约 55元/年
- **Namecheap**：国际域名注册商

### DNS 配置：
1. 添加 A 记录指向服务器 IP
2. 等待 DNS 生效（通常几分钟到几小时）

---

## 安全建议

### 1. 修改生产环境配置

编辑 `app.py`：
```python
if __name__ == '__main__':
    # 生产环境不要用 debug=True
    app.run(debug=False, host='0.0.0.0', port=8080)
```

### 2. 使用环境变量

```python
import os

app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY', 'your-secret-key')
```

### 3. 启用 HTTPS

使用 Let's Encrypt 免费证书：
```bash
# 安装 certbot
sudo apt install certbot python3-certbot-nginx

# 获取证书
sudo certbot --nginx -d yourdomain.com
```

---

## 性能优化

### 1. 启用 Gzip 压缩

```python
from flask_compress import Compress
Compress(app)
```

### 2. 静态文件 CDN

将 `static/` 目录上传到 CDN（如七牛云、又拍云）

### 3. 缓存配置

```python
@app.after_request
def add_header(response):
    response.cache_control.max_age = 300
    return response
```

---

## 监控和维护

### 日志记录

```python
import logging

logging.basicConfig(
    filename='app.log',
    level=logging.INFO,
    format='%(asctime)s %(levelname)s: %(message)s'
)
```

### 进程管理（Linux）

使用 systemd 或 supervisor 保持应用运行：

```ini
# /etc/systemd/system/dst-band.service
[Unit]
Description=DST Band Website
After=network.target

[Service]
User=www-data
WorkingDirectory=/path/to/app
ExecStart=/usr/bin/gunicorn -w 4 -b 0.0.0.0:8080 app:app
Restart=always

[Install]
WantedBy=multi-user.target
```

启动服务：
```bash
sudo systemctl start dst-band
sudo systemctl enable dst-band
```

---

## 常见问题

### Q: 如何更新曲目？
A: 编辑 `songs.yaml`，添加 PDF 到 `static/scores/`，重启应用

### Q: 如何备份数据？
A: 备份 `songs.yaml` 和 `static/scores/` 目录

### Q: 如何限制访问？
A: 可以添加简单的密码保护或使用 Nginx 的 Basic Auth

---

## 推荐方案总结

| 方案 | 难度 | 费用 | 适用场景 |
|------|------|------|----------|
| 本地运行 | ⭐ | 免费 | 乐队内部使用 |
| Vercel | ⭐⭐ | 免费 | 快速上线，全球访问 |
| Railway | ⭐⭐ | 免费 | 简单部署，自动化 |
| 云服务器 | ⭐⭐⭐⭐ | 付费 | 完全控制，国内访问 |

**新手推荐**：先用本地运行测试，然后用 Vercel 或 Railway 免费部署。
