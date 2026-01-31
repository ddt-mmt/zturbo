#!/bin/bash
# ZTURBO Installer
# Author: Didit

if [ "$EUID" -ne 0 ]; then echo "❌ Run as root"; exit 1; fi

echo ">> Installing dependencies..."
if command -v apt-get &> /dev/null; then
    apt-get update && apt-get install -y rsync fpart
elif command -v yum &> /dev/null; then
    yum install -y rsync fpart
fi

echo ">> Installing scripts..."
mkdir -p /usr/local/bin
cp zturbo /usr/local/bin/
cp zmturbo /usr/local/bin/
chmod +x /usr/local/bin/zturbo /usr/local/bin/zmturbo

echo "✅ ZTURBO Installed! Run 'zturbo' to start."
