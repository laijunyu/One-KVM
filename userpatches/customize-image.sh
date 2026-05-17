#!/bin/bash
# Armbian 构建定制脚本：为 Orange Pi Zero 设置静态 IP

# 变量 SDCARD 指向已挂载的目标系统根目录
INTERFACES_FILE="${SDCARD}/etc/network/interfaces"

# 备份原始配置文件（可选）
if [ -f "$INTERFACES_FILE" ]; then
    cp "$INTERFACES_FILE" "${INTERFACES_FILE}.bak"
fi

# 写入静态 IP 配置（适用于传统命名 eth0）
cat <<'EOF' >> "$INTERFACES_FILE"

# Custom static IP for Orange Pi Zero
auto eth0
iface eth0 inet static
    address 192.168.114.2/24
    gateway 192.168.114.1
    dns-nameservers 8.8.8.8 1.1.1.1
EOF

echo "Static IP for eth0 configured successfully."
