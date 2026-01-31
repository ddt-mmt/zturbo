#!/bin/bash
# ZTURBO Installer
# Author: Didit

if [ "$EUID" -ne 0 ]; then echo "❌ Run as root (sudo ./install.sh)"; exit 1; fi

# Ensure we are in the directory containing the script and binaries
cd "$(dirname "$0")"

if [ ! -f "zturbo" ] || [ ! -f "zmturbo" ]; then
    echo "❌ Error: zturbo or zmturbo files not found in the current directory."
    exit 1
fi

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

echo "✅ ZTURBO Installed to /usr/local/bin/!"
echo "   Run 'zturbo' anywhere to start the engine."
echo "   Run 'zmturbo' anywhere to start monitoring."
