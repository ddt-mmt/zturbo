#!/bin/bash
# ZTURBO Universal Installer
# Support: Debian, Ubuntu, Kali, CentOS, RHEL, AlmaLinux, Rocky, Fedora

if [ "$EUID" -ne 0 ]; then echo "❌ Run as root (sudo ./install.sh)"; exit 1; fi

# Ensure we are in the directory containing the script
cd "$(dirname "$0")"

echo ">> Detecting Operating System..."
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    echo "   Detected: $OS"
else
    echo "   Unknown OS. Proceeding with caution..."
fi

echo ">> Installing dependencies..."

# DETECT PACKAGE MANAGER
if command -v apt-get &> /dev/null; then
    # Debian/Ubuntu Family
    apt-get update -qq
    apt-get install -y rsync fpart
elif command -v dnf &> /dev/null; then
    # Modern RHEL/CentOS/Fedora
    dnf install -y epel-release 2>/dev/null
    dnf install -y rsync fpart
elif command -v yum &> /dev/null; then
    # Older CentOS/RHEL
    yum install -y epel-release 2>/dev/null
    yum install -y rsync fpart
elif command -v pacman &> /dev/null; then
    # Arch Linux
    pacman -Sy --noconfirm rsync fpart
else
    echo "⚠️  Warning: Package manager not found. Please install 'rsync' manually."
fi

echo ">> Installing binaries..."
if [ ! -f "zturbo" ] || [ ! -f "zmturbo" ]; then
    echo "❌ Error: Source files (zturbo/zmturbo) missing!"
    exit 1
fi

mkdir -p /usr/local/bin
cp zturbo /usr/local/bin/
cp zmturbo /usr/local/bin/
chmod +x /usr/local/bin/zturbo /usr/local/bin/zmturbo

echo "==============================================="
echo "✅ ZTURBO INSTALLED SUCCESSFULLY!"
echo "==============================================="
echo "   Command: zturbo   (Start Transfer)"
echo "   Command: zmturbo  (Start Monitoring)"
echo "==============================================="