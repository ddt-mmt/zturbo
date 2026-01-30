# ZTURBO - High Performance Data Transfer Engine 🚀

**ZTURBO** is a robust, interactive TUI (Text User Interface) wrapper for `rsync` and `fpsync` designed for high-speed data migration on Linux servers. Features dedicated monitoring center (**ZMTURBO**) and Process Group killing capabilities.

## ✨ Key Features
* **⚡ Hybrid Engine:** Switch between `SAFE` mode (Standard rsync) and `TURBO` mode (Multi-threaded fpsync).
* **📂 Multi-Select Batch:** Select multiple files and folders to transfer in one go.
* **🛡️ Integrity Check:** Automatic post-transfer reconciliation (Byte & File count audit).
* **📊 ZMTURBO Monitor:**
    * Real-time progress & resource usage (CPU/RAM per job).
    * **Zombie Slayer:** Kill process groups cleanly to prevent zombie processes.
    * System Health Dashboard.

## 📦 Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/ddt-mmt/zturbo.git
   cd zturbo
   ```
2. Run the installer (root required):
   ```bash
   chmod +x install.sh
   sudo ./install.sh
   ```

## 🚀 Usage
* **Transfer:** `sudo zturbo`
* **Monitor:** `sudo zmturbo`

## 📄 License
MIT License
