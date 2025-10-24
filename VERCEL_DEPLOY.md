# Vercel 部署指南

## 方式一：通过 Vercel CLI（推荐）

### 1. 安装 Node.js
如果还没有安装 Node.js，先安装：
- 访问 https://nodejs.org
- 下载并安装 LTS 版本

### 2. 安装 Vercel CLI
```bash
npm install -g vercel
```

### 3. 登录 Vercel
```bash
vercel login
```
会打开浏览器，选择登录方式（GitHub/GitLab/Bitbucket/Email）

### 4. 部署项目
在项目根目录运行：
```bash
vercel
```

按照提示操作：
- Set up and deploy? **Y**
- Which scope? 选择你的账户
- Link to existing project? **N**
- What's your project's name? **dst-band** (或其他名字)
- In which directory is your code located? **./** (直接回车)

### 5. 部署完成
会得到一个 URL，类似：
```
https://dst-band.vercel.app
```

### 6. 后续更新
每次修改后，只需运行：
```bash
vercel --prod
```

---

## 方式二：通过 GitHub + Vercel（自动部署）

### 1. 创建 GitHub 仓库
```bash
# 初始化 Git
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit"

# 创建 GitHub 仓库后，推送代码
git remote add origin https://github.com/你的用户名/dst-band.git
git branch -M main
git push -u origin main
```

### 2. 连接 Vercel
1. 访问 https://vercel.com
2. 点击 "New Project"
3. 导入你的 GitHub 仓库
4. 点击 "Deploy"

### 3. 自动部署
以后每次推送到 GitHub，Vercel 会自动部署！

---

## 重要配置

### 环境变量（如果需要）
在 Vercel 项目设置中添加：
- `FLASK_ENV` = `production`

### 自定义域名
1. 在 Vercel 项目设置中点击 "Domains"
2. 添加你的域名
3. 按照提示配置 DNS

---

## 注意事项

### ⚠️ Vercel 限制
- **无服务器函数**：每次请求都是独立的
- **文件上传限制**：不支持运行时文件上传
- **PDF 文件**：必须在部署前放入 `static/scores/`

### 📁 部署前检查清单
- [ ] PDF 文件已放入 `static/scores/`
- [ ] `songs.yaml` 已配置正确
- [ ] 文件名和 `songs.yaml` 中的 `filename` 一致

### 🔄 更新曲目流程
1. 添加 PDF 到 `static/scores/`
2. 更新 `songs.yaml`
3. 运行 `vercel --prod` 重新部署

---

## 常见问题

### Q: 部署失败怎么办？
A: 查看 Vercel 的部署日志，通常是依赖问题。确保 `requirements.txt` 正确。

### Q: 如何查看日志？
A: 在 Vercel 项目页面点击 "Deployments" → 选择部署 → "View Function Logs"

### Q: 可以使用免费版吗？
A: 可以！Vercel 免费版对个人项目完全够用。

### Q: 如何删除项目？
A: Vercel 项目设置 → "Advanced" → "Delete Project"

---

## 性能优化

### 1. 压缩 PDF
使用工具压缩 PDF 文件，减小体积：
- https://www.ilovepdf.com/compress_pdf
- https://smallpdf.com/compress-pdf

### 2. 使用 CDN
Vercel 自带全球 CDN，静态文件会自动加速。

---

## ⚠️ 注意

Vercel 在国内访问需要 VPN。

**推荐使用 Railway 代替**：
- 查看 `RAILWAY_SETUP.md` 获取详细教程
- 查看 `QUICK_START.md` 获取快速开始指南

---

## 下一步

部署成功后，你可以：
1. 分享链接给乐队成员
2. 配置自定义域名（可选）
3. 在 Vercel 设置中查看访问统计

祝部署顺利！🎷
