#!/bin/bash
# ZTURBO Universal Installer
# Standard: Enterprise English Interface
# Support: Debian, Ubuntu, Kali, CentOS, RHEL, AlmaLinux, Rocky, Fedora, Arch

if [ "$EUID" -ne 0 ]; then echo "❌ Access Denied: Please run as root (sudo ./install.sh)"; exit 1; fi

cd "$(dirname "$0")"

echo ">> Detecting Operating System..."
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    echo "   Target OS: $OS"
else
    echo "   Target OS: Unknown. Proceeding with standard installation..."
fi

echo ">> Installing system dependencies..."

# PACKAGE MANAGER DETECTION & INSTALLATION
if command -v apt-get &> /dev/null; then
    apt-get update -qq
    apt-get install -y rsync fpart
elif command -v dnf &> /dev/null; then
    dnf install -y epel-release 2>/dev/null
    dnf install -y rsync fpart
elif command -v yum &> /dev/null; then
    yum install -y epel-release 2>/dev/null
    yum install -y rsync fpart
elif command -v pacman &> /dev/null; then
    pacman -Sy --noconfirm rsync fpart
else
    echo "⚠️  Warning: Package manager not identified. Please ensure 'rsync' and 'fpart' are installed manually."
fi

echo ">> Deploying binaries..."
if [ ! -f "zturbo" ] || [ ! -f "zmturbo" ]; then
    echo "❌ Critical Error: Source binaries (zturbo/zmturbo) not found in current directory."
    exit 1
fi

mkdir -p /usr/local/bin
cp zturbo /usr/local/bin/
cp zmturbo /usr/local/bin/
chmod +x /usr/local/bin/zturbo /usr/local/bin/zmturbo

echo "==============================================="
echo "✅ ZTURBO INSTALLED SUCCESSFULLY!"
echo "==============================================="
echo "   Execution Command: zturbo"
echo "   Monitoring Command: zmturbo"
echo "==============================================="
