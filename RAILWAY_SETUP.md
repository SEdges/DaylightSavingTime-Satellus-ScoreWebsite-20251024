# Railway 部署完整指南

## 📋 准备工作检查清单

在开始之前，确保：
- ✅ 已安装 Git
- ✅ 有 GitHub 账号
- ✅ PDF 乐谱文件已放入 `static/scores/` 目录
- ✅ `songs.yaml` 已配置好曲目信息

---

## 🚀 部署步骤

### 第一步：将代码推送到 GitHub

#### 1. 初始化 Git 仓库（如果还没有）

```bash
# 在项目目录打开终端
git init
```

#### 2. 添加所有文件

```bash
git add .
```

#### 3. 提交代码

```bash
git commit -m "Initial commit: 夏令时爵士乐队网站"
```

#### 4. 在 GitHub 创建仓库

1. 访问 https://github.com/new
2. 仓库名称：`dst-band`（或其他名字）
3. 选择 **Public**（公开）或 **Private**（私有）
4. **不要**勾选 "Add a README file"
5. 点击 "Create repository"

#### 5. 推送代码到 GitHub

复制 GitHub 显示的命令，类似：

```bash
git remote add origin https://github.com/你的用户名/dst-band.git
git branch -M main
git push -u origin main
```

---

### 第二步：部署到 Railway

#### 1. 访问 Railway

打开浏览器，访问：
```
https://railway.app
```

#### 2. 登录

- 点击右上角 **"Login"**
- 选择 **"Login with GitHub"**
- 授权 Railway 访问你的 GitHub

#### 3. 创建新项目

- 点击 **"New Project"**
- 选择 **"Deploy from GitHub repo"**
- 在列表中找到 `dst-band` 仓库
- 点击仓库名称

#### 4. 等待部署

Railway 会自动：
- ✅ 检测 Python 项目
- ✅ 读取 `requirements.txt` 安装依赖
- ✅ 使用 `Procfile` 启动应用
- ✅ 分配端口和域名

部署过程大约 **2-3 分钟**。

#### 5. 查看部署状态

在项目页面可以看到：
- **Deployments**：部署历史
- **Logs**：实时日志
- **Metrics**：性能监控

等待状态变为 **"Success"** ✅

#### 6. 生成域名

- 点击项目卡片
- 进入 **"Settings"** 标签
- 找到 **"Domains"** 部分
- 点击 **"Generate Domain"**
- 获得类似 `dst-band-production.up.railway.app` 的域名

#### 7. 访问网站

复制域名，在浏览器打开：
```
https://你的项目名.up.railway.app
```

🎉 **部署完成！**

---

## 🔧 配置环境变量（可选）

### 添加环境变量

1. 在 Railway 项目页面
2. 点击 **"Variables"** 标签
3. 点击 **"New Variable"**
4. 添加：
   ```
   FLASK_ENV = production
   ```
5. 点击 **"Add"**

---

## 📝 更新网站内容

### 更新曲目

#### 1. 修改本地文件

- 编辑 `songs.yaml` 添加新曲目
- 将新的 PDF 文件放入 `static/scores/`

#### 2. 推送到 GitHub

```bash
git add .
git commit -m "添加新曲目"
git push
```

#### 3. 自动部署

Railway 会自动检测到更新并重新部署！

大约 1-2 分钟后，网站就会更新。

---

## 🎯 常用命令

### 查看 Git 状态
```bash
git status
```

### 添加文件
```bash
git add .
```

### 提交更改
```bash
git commit -m "描述你的更改"
```

### 推送到 GitHub
```bash
git push
```

### 查看远程仓库
```bash
git remote -v
```

---

## 🔍 故障排查

### 问题 1：部署失败

**查看日志**：
1. 在 Railway 项目页面
2. 点击 **"Deployments"**
3. 点击失败的部署
4. 查看 **"Deploy Logs"**

**常见原因**：
- `requirements.txt` 中的包版本不兼容
- Python 版本不匹配
- 代码有语法错误

**解决方法**：
- 检查日志中的错误信息
- 修复代码
- 重新推送

### 问题 2：网站打不开

**检查**：
1. 确认部署状态是 "Success"
2. 确认域名已生成
3. 等待几分钟（DNS 生效）

**解决方法**：
- 在 Railway 查看 "Logs" 标签
- 检查是否有运行时错误

### 问题 3：PDF 文件显示不出来

**原因**：
- PDF 文件没有推送到 GitHub
- 文件名和 `songs.yaml` 不匹配

**解决方法**：
```bash
# 检查 PDF 文件是否在 Git 中
git ls-files static/scores/

# 如果没有，添加并推送
git add static/scores/*.pdf
git commit -m "添加 PDF 文件"
git push
```

### 问题 4：国内访问慢

**原因**：
- Railway 服务器在海外

**解决方法**：
- 使用 CDN 加速（高级）
- 或改用国内服务器（阿里云/腾讯云）

---

## 💰 费用说明

### Railway 免费额度

- **$5/月** 免费额度
- 相当于约 **500 小时**运行时间
- 对个人项目完全够用

### 如何查看用量

1. 在 Railway 首页
2. 点击右上角头像
3. 选择 **"Usage"**
4. 查看当前用量

### 超出额度怎么办

- 可以添加信用卡继续使用
- 或者暂停项目，下月重置

---

## 🌐 绑定自定义域名（可选）

### 前提条件
- 已购买域名（如 `dstband.com`）

### 步骤

#### 1. 在 Railway 添加域名

1. 进入项目 **"Settings"**
2. 找到 **"Domains"**
3. 点击 **"Custom Domain"**
4. 输入你的域名：`www.dstband.com`
5. 记下显示的 CNAME 值

#### 2. 配置 DNS

在你的域名服务商（阿里云/腾讯云等）：

1. 添加 CNAME 记录
   - 主机记录：`www`
   - 记录类型：`CNAME`
   - 记录值：Railway 提供的值
   - TTL：`600`

2. 等待 DNS 生效（几分钟到几小时）

#### 3. 访问自定义域名

```
https://www.dstband.com
```

---

## 📊 监控和维护

### 查看访问日志

1. Railway 项目页面
2. 点击 **"Logs"** 标签
3. 实时查看访问记录

### 查看性能指标

1. 点击 **"Metrics"** 标签
2. 查看：
   - CPU 使用率
   - 内存使用
   - 网络流量

### 重启应用

1. 进入 **"Settings"**
2. 点击 **"Restart"**

---

## 🎉 完成！

现在你的网站已经成功部署到 Railway！

**你的网站地址**：
```
https://你的项目名.up.railway.app
```

**分享给乐队成员**：
- 直接发送链接
- 任何人都可以访问
- 无需登录

**后续维护**：
- 添加新曲目：修改 `songs.yaml` → 推送到 GitHub
- Railway 自动更新
- 简单方便！

---

## 📞 需要帮助？

如果遇到问题：
1. 查看 Railway 的部署日志
2. 检查 GitHub 仓库是否正确
3. 确认 PDF 文件已上传

祝你使用愉快！🎷
