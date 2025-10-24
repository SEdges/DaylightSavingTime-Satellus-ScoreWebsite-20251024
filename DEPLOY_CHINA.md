# 国内部署方案指南

## 🇨🇳 适合国内访问的部署方案

### 方案一：阿里云/腾讯云服务器（推荐）

**优点**：
- ✅ 国内访问速度快
- ✅ 完全控制
- ✅ 稳定可靠

**费用**：
- 学生优惠：约 10元/月
- 轻量应用服务器：约 24元/月起

#### 部署步骤：

**1. 购买服务器**
- 阿里云：https://www.aliyun.com/product/ecs
- 腾讯云：https://cloud.tencent.com/product/cvm
- 选择：Ubuntu 20.04 或 CentOS 7

**2. 连接服务器**
```bash
ssh root@你的服务器IP
```

**3. 安装环境**
```bash
# 更新系统
sudo apt update && sudo apt upgrade -y

# 安装 Python 和 pip
sudo apt install python3 python3-pip -y

# 安装 Git
sudo apt install git -y
```

**4. 上传代码**
```bash
# 方式1：使用 Git
git clone https://github.com/你的用户名/dst-band.git
cd dst-band

# 方式2：使用 SCP 上传
# 在本地运行：
scp -r . root@服务器IP:/root/dst-band
```

**5. 安装依赖**
```bash
pip3 install -r requirements.txt
```

**6. 运行应用**
```bash
# 临时运行（测试用）
python3 app.py

# 后台运行（推荐）
nohup python3 app.py > app.log 2>&1 &
```

**7. 配置防火墙**
```bash
# 开放 8080 端口
sudo ufw allow 8080
```

**8. 访问网站**
```
http://你的服务器IP:8080
```

---

### 方案二：宝塔面板（最简单）

**优点**：
- ✅ 图形化界面，不需要命令行
- ✅ 一键部署
- ✅ 自动配置 Nginx

#### 部署步骤：

**1. 安装宝塔面板**
```bash
# Ubuntu/Debian
wget -O install.sh https://download.bt.cn/install/install-ubuntu_6.0.sh && sudo bash install.sh

# CentOS
yum install -y wget && wget -O install.sh https://download.bt.cn/install/install_6.0.sh && sh install.sh
```

**2. 登录宝塔面板**
- 访问：http://服务器IP:8888
- 使用安装时显示的账号密码登录

**3. 安装软件**
- 在"软件商店"安装：
  - Nginx
  - Python 项目管理器

**4. 创建项目**
- 点击"Python项目管理器"
- 添加项目
- 上传代码
- 安装依赖
- 启动项目

**5. 配置域名（可选）**
- 在"网站"中添加站点
- 配置反向代理到 8080 端口

---

### 方案三：Gitee Pages + Cloudflare（免费）

**限制**：只能部署静态网站，不适合我们的 Flask 应用

---

### 方案四：Railway（国内可访问）

**优点**：
- ✅ 免费 $5/月额度
- ✅ 国内可以访问（相对稳定）
- ✅ 自动部署

#### 部署步骤：

**1. 访问 Railway**
```
https://railway.app
```

**2. 连接 GitHub**
- 注册/登录
- 连接 GitHub 仓库

**3. 部署**
- 选择仓库
- 自动检测 Python 项目
- 点击 Deploy

**4. 获取域名**
- 在 Settings 中生成域名
- 类似：xxx.up.railway.app

---

### 方案五：本地 + 内网穿透（临时方案）

**适合**：临时分享、演示

#### 使用 ngrok：

**1. 下载 ngrok**
```
https://ngrok.com/download
```

**2. 运行应用**
```bash
python app.py
```

**3. 启动内网穿透**
```bash
ngrok http 8080
```

**4. 获得公网地址**
```
https://xxxx.ngrok.io
```

#### 使用 花生壳（国内）：

**1. 注册账号**
```
https://hsk.oray.com
```

**2. 下载客户端**
- 安装并登录

**3. 配置映射**
- 内网端口：8080
- 获得域名

---

## 💰 费用对比

| 方案 | 费用 | 国内访问 | 难度 |
|------|------|----------|------|
| 阿里云/腾讯云 | 10-50元/月 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| 宝塔面板 | 服务器费用 | ⭐⭐⭐⭐⭐ | ⭐⭐ |
| Railway | 免费 | ⭐⭐⭐ | ⭐⭐ |
| ngrok | 免费/付费 | ⭐⭐ | ⭐ |
| 花生壳 | 免费/付费 | ⭐⭐⭐⭐ | ⭐ |

---

## 🎯 推荐方案

### 预算充足（推荐）
**阿里云轻量应用服务器 + 宝塔面板**
- 24元/月
- 国内访问快
- 操作简单

### 预算有限
**Railway**
- 免费
- 自动部署
- 国内可访问（不保证稳定）

### 临时使用
**本地运行 + 花生壳**
- 免费
- 适合演示

---

## 📝 域名和备案

### 域名购买
- 阿里云：https://wanwang.aliyun.com
- 腾讯云：https://dnspod.cloud.tencent.com
- 价格：.com 约 55元/年

### 备案要求
- 使用国内服务器必须备案
- 备案时间：约 20 天
- 免费，但需要提供资料

### 不需要备案的情况
- 使用香港/海外服务器
- 使用二级域名（如 Railway 提供的）

---

## 🔧 生产环境配置

### 使用 Supervisor 保持运行

**1. 安装**
```bash
sudo apt install supervisor -y
```

**2. 配置**
```bash
sudo nano /etc/supervisor/conf.d/dst-band.conf
```

内容：
```ini
[program:dst-band]
directory=/root/dst-band
command=/usr/bin/python3 app.py
autostart=true
autorestart=true
stderr_logfile=/var/log/dst-band.err.log
stdout_logfile=/var/log/dst-band.out.log
```

**3. 启动**
```bash
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start dst-band
```

---

## 🚀 快速开始（阿里云示例）

```bash
# 1. 连接服务器
ssh root@你的IP

# 2. 一键安装脚本
curl -sSL https://raw.githubusercontent.com/你的仓库/main/install.sh | bash

# 3. 访问
http://你的IP:8080
```

---

## ❓ 常见问题

### Q: 服务器配置要求？
A: 最低 1核1G 即可，推荐 1核2G

### Q: 如何更新代码？
A: 
```bash
cd /root/dst-band
git pull
sudo supervisorctl restart dst-band
```

### Q: 如何查看日志？
A:
```bash
tail -f /var/log/dst-band.out.log
```

### Q: 如何配置 HTTPS？
A: 使用宝塔面板一键申请 SSL 证书，或使用 Let's Encrypt

---

需要具体哪个方案的详细教程，我可以继续帮你配置！
