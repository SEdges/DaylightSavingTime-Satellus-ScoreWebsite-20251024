# 快速开始 - 5 分钟部署到 Railway

## 🚀 超简化版部署指南

### 前提条件
- ✅ 有 GitHub 账号
- ✅ 已安装 Git

---

## 📝 三步部署

### 第一步：推送到 GitHub（2分钟）

```bash
# 1. 初始化 Git
git init

# 2. 添加所有文件
git add .

# 3. 提交
git commit -m "夏令时乐队网站"

# 4. 在 GitHub 创建仓库（访问 https://github.com/new）
#    仓库名：dst-band
#    类型：Public

# 5. 推送（替换成你的 GitHub 用户名）
git remote add origin https://github.com/你的用户名/dst-band.git
git branch -M main
git push -u origin main
```

---

### 第二步：部署到 Railway（2分钟）

1. 访问 https://railway.app
2. 点击 **"Login with GitHub"**
3. 点击 **"New Project"**
4. 选择 **"Deploy from GitHub repo"**
5. 选择 `dst-band` 仓库
6. 等待部署完成（约2分钟）

---

### 第三步：获取网址（1分钟）

1. 点击项目卡片
2. 进入 **"Settings"**
3. 找到 **"Domains"**
4. 点击 **"Generate Domain"**
5. 复制域名，访问！

---

## ✅ 完成！

你的网站地址：
```
https://xxx.up.railway.app
```

---

## 🔄 更新网站

```bash
# 修改文件后
git add .
git commit -m "更新"
git push

# Railway 自动部署！
```

---

## ❓ 遇到问题？

查看详细教程：`RAILWAY_SETUP.md`
