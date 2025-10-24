# 免费部署平台对比

## 🆓 支持 Python/Flask 的免费平台

### 1. Railway ⭐⭐⭐⭐⭐（推荐）

**优点**：
- ✅ 完全免费（$5/月额度）
- ✅ 支持 Python/Flask
- ✅ 自动部署
- ✅ 国内可访问（大部分时间）
- ✅ 提供免费域名

**缺点**：
- ⚠️ 偶尔可能需要 VPN

**部署步骤**：
1. 访问 https://railway.app
2. 用 GitHub 登录
3. New Project → Deploy from GitHub repo
4. 选择你的仓库
5. 自动部署完成！

**访问地址**：
```
https://你的项目名.up.railway.app
```

---

### 2. Render ⭐⭐⭐⭐

**优点**：
- ✅ 免费套餐
- ✅ 支持 Python
- ✅ 自动 HTTPS
- ✅ 国内可访问

**缺点**：
- ⚠️ 免费版会休眠（15分钟无访问）
- ⚠️ 启动较慢

**部署步骤**：
1. 访问 https://render.com
2. New → Web Service
3. 连接 GitHub 仓库
4. 配置：
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `gunicorn app:app`
5. 部署

---

### 3. PythonAnywhere ⭐⭐⭐⭐

**优点**：
- ✅ 专为 Python 设计
- ✅ 免费套餐
- ✅ 简单易用
- ✅ 国内可访问

**缺点**：
- ⚠️ 免费版有流量限制
- ⚠️ 需要手动配置

**部署步骤**：
1. 注册 https://www.pythonanywhere.com
2. 上传代码
3. 在 Web 标签页配置 Flask 应用
4. 重启应用

**访问地址**：
```
https://你的用户名.pythonanywhere.com
```

---

### 4. Fly.io ⭐⭐⭐

**优点**：
- ✅ 免费套餐
- ✅ 支持 Docker
- ✅ 全球部署

**缺点**：
- ⚠️ 国内访问不稳定
- ⚠️ 配置稍复杂

---

### 5. Glitch ⭐⭐⭐

**优点**：
- ✅ 完全免费
- ✅ 在线编辑代码
- ✅ 即时预览

**缺点**：
- ⚠️ 会休眠
- ⚠️ 性能一般

---

## 📊 平台对比表

| 平台 | 免费额度 | 国内访问 | 难度 | 推荐度 |
|------|---------|---------|------|--------|
| Railway | $5/月 | ⭐⭐⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ |
| Render | 750小时/月 | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ |
| PythonAnywhere | 100MB流量/天 | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ |
| Fly.io | 3个应用 | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| Glitch | 无限 | ⭐⭐⭐ | ⭐ | ⭐⭐⭐ |

---

## 🎯 我的推荐

### 最佳选择：Railway

**理由**：
1. 完全免费（$5/月额度对个人项目够用）
2. 国内大部分时间可以访问
3. 部署最简单（连接 GitHub 即可）
4. 自动部署（推送代码自动更新）

### 备选方案：PythonAnywhere

**理由**：
1. 专为 Python 设计
2. 国内访问稳定
3. 免费版够用

---

## 🚀 Railway 快速部署教程

### 前提条件
- GitHub 账号
- 代码已推送到 GitHub

### 步骤

**1. 访问 Railway**
```
https://railway.app
```

**2. 登录**
- 点击 "Login"
- 选择 "Login with GitHub"
- 授权 Railway 访问你的仓库

**3. 创建项目**
- 点击 "New Project"
- 选择 "Deploy from GitHub repo"
- 选择你的 `dst-band` 仓库

**4. 等待部署**
- Railway 会自动检测 Python 项目
- 自动安装依赖
- 自动启动应用
- 大约 2-3 分钟完成

**5. 获取域名**
- 点击项目
- 进入 "Settings"
- 点击 "Generate Domain"
- 获得类似 `xxx.up.railway.app` 的域名

**6. 访问网站**
```
https://你的项目名.up.railway.app
```

### 配置环境变量（可选）

在 Railway 项目设置中添加：
```
FLASK_ENV=production
```

### 自动部署

以后每次推送代码到 GitHub，Railway 会自动重新部署！

```bash
git add .
git commit -m "更新曲目"
git push
```

---

## 💡 如果 Railway 访问不了

### 临时方案：使用代理
- 部署时可能需要 VPN
- 部署完成后，网站本身国内可以访问

### 永久方案：PythonAnywhere
1. 注册 https://www.pythonanywhere.com
2. 上传代码（可以用 Git 或直接上传）
3. 配置 Web 应用
4. 完成！

---

## 📝 需要的文件

我们的项目已经包含了所有需要的配置文件：
- ✅ `requirements.txt` - Python 依赖
- ✅ `Procfile` - Railway/Heroku 配置
- ✅ `runtime.txt` - Python 版本
- ✅ `app.py` - Flask 应用

直接部署即可！

---

## ❓ 常见问题

### Q: Railway 免费额度够用吗？
A: 够用！$5/月对于个人项目完全足够，相当于 500 小时运行时间。

### Q: 如何绑定自己的域名？
A: 在 Railway 项目设置中添加自定义域名，然后配置 DNS。

### Q: 如何查看日志？
A: 在 Railway 项目页面点击 "Deployments" → "View Logs"

### Q: 如何更新曲目？
A: 
1. 修改 `songs.yaml`
2. 添加 PDF 到 `static/scores/`
3. 推送到 GitHub
4. Railway 自动部署

---

## 🎉 总结

**GitHub Pages**：❌ 不支持 Flask

**推荐使用**：
1. **Railway**（最简单，免费）
2. **PythonAnywhere**（备选，稳定）
3. **阿里云**（付费，最快）

需要我帮你配置 Railway 部署吗？
