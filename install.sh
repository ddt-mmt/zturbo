#!/bin/bash
# ZTURBO V1.3.5 (Modular & Refined) Installer
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

echo ">> Deploying ZTURBO binaries and modules..."

# Memverifikasi keberadaan file sumber
if [ ! -f "zturbo" ] || [ ! -f "zmturbo" ] || [ ! -d "lib" ]; then
    echo "❌ Critical Error: Source binaries (zturbo/zmturbo) or lib directory not found in current directory."
    exit 1
fi

# Membuat direktori lib untuk modul dan menyalin modul
mkdir -p /usr/lib/zturbo
cp lib/*.sh /usr/lib/zturbo/
chmod 644 /usr/lib/zturbo/*.sh # Modul tidak perlu executable

# Menyalin skrip utama ke PATH
cp zturbo /usr/local/bin/
cp zmturbo /usr/local/bin/
chmod +x /usr/local/bin/zturbo /usr/local/bin/zmturbo # Skrip utama perlu executable

echo "==============================================="
echo "✅ ZTURBO V1.3.5 (Modular & Refined) INSTALLED SUCCESSFULLY!"
echo "==============================================="
echo "   Execution Command: zturbo"
echo "   Monitoring Command: zmturbo"
echo "   Module Directory: /usr/lib/zturbo"
echo "   Reports & Dashboard: ~/.zturbo/reports & /tmp/zturbo_dashboard"
echo "==============================================="
