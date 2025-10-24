#!/bin/bash
# 夏令时爵士乐队网站 - 一键安装脚本（适用于 Ubuntu/Debian）

echo "=========================================="
echo "  夏令时爵士乐队网站 - 一键安装脚本"
echo "=========================================="
echo ""

# 检查是否为 root 用户
if [ "$EUID" -ne 0 ]; then 
    echo "请使用 root 用户运行此脚本"
    echo "使用命令: sudo bash install.sh"
    exit 1
fi

# 更新系统
echo "1. 更新系统..."
apt update && apt upgrade -y

# 安装 Python 和依赖
echo "2. 安装 Python 环境..."
apt install -y python3 python3-pip git

# 克隆或更新代码
if [ -d "/root/dst-band" ]; then
    echo "3. 更新代码..."
    cd /root/dst-band
    git pull
else
    echo "3. 下载代码..."
    cd /root
    # 这里需要替换为你的 Git 仓库地址
    echo "请手动上传代码到 /root/dst-band 目录"
    mkdir -p /root/dst-band
    echo "代码目录已创建: /root/dst-band"
fi

cd /root/dst-band

# 安装 Python 依赖
echo "4. 安装 Python 依赖..."
pip3 install -r requirements.txt

# 安装 Supervisor
echo "5. 安装进程管理工具..."
apt install -y supervisor

# 配置 Supervisor
echo "6. 配置自动启动..."
cat > /etc/supervisor/conf.d/dst-band.conf << EOF
[program:dst-band]
directory=/root/dst-band
command=/usr/bin/python3 app.py
autostart=true
autorestart=true
stderr_logfile=/var/log/dst-band.err.log
stdout_logfile=/var/log/dst-band.out.log
user=root
environment=FLASK_ENV="production"
EOF

# 重启 Supervisor
supervisorctl reread
supervisorctl update
supervisorctl start dst-band

# 配置防火墙
echo "7. 配置防火墙..."
ufw allow 8080
ufw allow 22
echo "y" | ufw enable

# 获取服务器 IP
SERVER_IP=$(curl -s ifconfig.me)

echo ""
echo "=========================================="
echo "  安装完成！"
echo "=========================================="
echo ""
echo "访问地址: http://$SERVER_IP:8080"
echo ""
echo "常用命令："
echo "  查看状态: supervisorctl status dst-band"
echo "  重启服务: supervisorctl restart dst-band"
echo "  查看日志: tail -f /var/log/dst-band.out.log"
echo ""
echo "下一步："
echo "1. 将 PDF 乐谱文件上传到 /root/dst-band/static/scores/"
echo "2. 编辑 /root/dst-band/songs.yaml 添加曲目信息"
echo "3. 重启服务: supervisorctl restart dst-band"
echo ""
echo "=========================================="
