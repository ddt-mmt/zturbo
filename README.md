# 🚀 ZTURBO - High Performance Data Transfer Engine

![Version](https://img.shields.io/badge/version-1.3.3%20(Enterprise)-blue.svg?style=flat-square)
![Platform](https://img.shields.io/badge/platform-Linux-green.svg?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-orange.svg?style=flat-square)

**ZTURBO** is an enterprise-grade Command Line Interface (CLI) toolkit designed for large-scale data migration (Big Data) on high-performance infrastructure, such as Mikrotik CCR1072 routers and 10G/40G server environments.

This toolkit leverages the reliability of `rsync` and the speed of `fpsync` within a *Hybrid Parallelism* architecture, providing a modern interface with multi-layered security mechanisms.

---

## 🔥 Key Features (V1.3.3 Enterprise)

### 1. Robust & Resilient
*   **🛡️ Auto-Retry Mechanism**: Automatically retries transfers (up to 3 times) in case of packet loss or transient network interruptions.
*   **⏱️ Smart Timeout**: Detects "zombie" connections and resets them automatically to prevent resource exhaustion on network routers.
*   **💾 Pre-Flight Check**: Calculates source data size against destination disk availability before execution to prevent "Disk Full" errors.
*   **📂 Persistent Logs**: Job history and reports are securely stored in `~/.zturbo/reports`, safe from reboots or tool updates.
*   **⌨️ Smart Input**: Full *Readline* support (Backspace/Arrow keys) in all interactive menus for a seamless user experience.

### 2. Hybrid Parallel Engine
*   **🚀 File Parallelism**: Executes individual files in the **background (Parallel)** to saturate network bandwidth instantly.
*   **📂 Folder Partitioning**: Utilizes `fpsync` for multi-threaded folder synchronization.
*   **🏎️ Optimized Flags**: Pre-configured with `--sparse` (optimized for VM images), `-W` (Whole-File mode), and `--inplace` for maximum throughput.

### 3. Advanced Monitoring (ZMTURBO)
*   **📊 Unicode Dashboard**: Elegant, modern progress bars using solid Unicode blocks.
*   **📡 Network Traffic**: Real-time RX (Down) and TX (Up) speed monitoring.
*   **🧵 Thread Counter**: Live tracking of active process threads per job.
*   **⚡ Anti-Flicker Rendering**: Smooth screen updates using cursor-reset techniques (stable like `htop`).
*   **📉 Resource Guard**: Real-time monitoring of CPU Load and RAM usage to ensure system stability.

---

## 📝 Changelog

### V1.3.3 (Current)
*   **📡 Network Monitor**: Added real-time Download (RX) and Upload (TX) speed indicators.
*   **🧵 Thread Tracking**: Added live active thread/process counter per job.
*   **📂 Persistent History**: Reports are now saved to `~/.zturbo/reports` to survive reboots and updates.
*   **✨ UX Polish**: Implemented Smart Input buffering and strict Anti-Flicker cursor management.
*   **🐛 Critical Fix**: Resolved an issue where the transfer process would not start (infinite loop) after confirming with "OK" in the final review screen.

---

## 🆚 Operational Modes

ZTURBO offers two distinct modes tailored for different operational requirements:

| Feature | 🛡️ SAFE MODE (Default) | 🚀 TURBO MODE |
| :--- | :--- | :--- |
| **Philosophy** | "Reliability & System Stability" | "Maximum Performance" |
| **Execution** | Sequential (One by one) | Hybrid Parallel (Multi-Threaded) |
| **Priority** | Low Priority (`nice`/`ionice`) | High Priority (Max Resources) |
| **Write Method** | Atomic (Temp File -> Rename) | In-Place (Direct Write) |
| **CPU Usage** | Moderate (Delta/Checksum calculation) | Low (Whole-File Streaming) |
| **Best For** | **Business Hours**, Daily Syncs | **Initial Migration**, Maintenance Windows |
| **Resume** | Supported (via Partial Directory) | Supported (via In-Place Verification) |

---

## 📦 Installation

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/ddt-mmt/zturbo.git
    cd zturbo
    ```

2.  **Universal Installer**
    ```bash
    chmod +x install.sh
    sudo ./install.sh
    ```
    *The script automatically detects your OS (Ubuntu, CentOS, RHEL, Fedora, Arch) and installs required dependencies (`rsync`, `fpart`).*

### Alternative: Install via .DEB Package
For Debian/Ubuntu-based systems:
```bash
sudo dpkg -i dist/zturbo.deb
```

---

## 🚀 Getting Started

### 1. Running Transfers (ZTURBO)
Launch the interactive wizard by typing:
```bash
zturbo
```

### 2. Real-time Monitoring (ZMTURBO)
Open a new terminal session and type:
```bash
zmturbo
```

---

## 👨‍💻 Credits
*   **Original Idea & Concept**: [ddt-mmt](https://github.com/ddt-mmt)
*   **Developer**: [ddt-mmt](https://github.com/ddt-mmt)

## 🤝 License
Licensed under the **MIT License**.