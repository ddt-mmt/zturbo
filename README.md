# 🚀 ZTURBO - High Performance Data Transfer Engine

![Version](https://img.shields.io/badge/version-1.3-blue.svg?style=flat-square)
![Platform](https://img.shields.io/badge/platform-Linux-green.svg?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-orange.svg?style=flat-square)
![Maintenance](https://img.shields.io/badge/maintenance-Active-success.svg?style=flat-square)

**ZTURBO** adalah *Command Line Interface (CLI)* canggih yang membungkus kekuatan `rsync` dan `fpsync` untuk keperluan transfer data skala besar (Big Data) antar server. Dilengkapi dengan manajemen proses anti-zombie dan dashboard monitoring real-time.

---

## 🔥 Fitur Unggulan

| Fitur | Deskripsi |
| :--- | :--- |
| **⚡ Hybrid Engine** | Otomatis memilih antara `rsync` (Safe Mode) atau `fpsync` (Turbo Mode). |
| **🛒 Multi-Select** | Pilih file & folder sesuka hati dengan sistem *checklist* sebelum dikirim. |
| **🧟 Zombie Slayer** | Fitur keamanan yang mematikan proses macet hingga ke akarnya (PGID). |
| **🛡️ Integrity Check** | Verifikasi otomatis di akhir transfer (Byte & File count audit). |
| **📊 Smart Monitor** | Dashboard visual untuk memantau CPU, RAM, dan Progress Bar. |

---

## 📸 Tampilan (Preview)

### 1. Menu Transfer (ZTURBO)
Antarmuka interaktif untuk memilih source dan destination.

```text
┌──────────────────────────────────────────┐
│      ZTURBO - DATA TRANSFER ENGINE       │
└──────────────────────────────────────────┘
 [ BROWSE SOURCE ] /mnt/data/Project_Alpha
 ✅ Selected Items: 2

 [ ] [1] 📁 2023_Backup/
 [*] [2] 📁 2024_Backup/      <-- [TERPILIH]
 [ ] [3] 📁 Images/
 [*] [4] 📄 config.yaml       <-- [TERPILIH]

 👉 INPUT > d (Done)


┌──────────────────────────────────────────┐
│   ZMTURBO V1.1: MONITORING CENTER        │
└──────────────────────────────────────────┘
 HOST: Server-JKT | IP: 10.X.X.X
 HEALTH: CPU Load: 2.45 | RAM: 18%

 [ A. ACTIVE TRANSFERS ]
 PID     USER    CPU%   PROGRESS           DESTINATION
 -------------------------------------------------------
 45120   didit   85%    [#######.......]   .../2024_Backup
 45199   root    12%    [#############.]   .../SysLog



📦 Instalasi Cepat
Salin dan jalankan perintah berikut di terminal server Anda:

# 1. Clone Repository
git clone [https://github.com/ddt-mmt/zturbo.git](https://github.com/ddt-mmt/zturbo.git)
cd zturbo

# 2. Jalankan Installer (Otomatis)
chmod +x install.sh
sudo ./install.sh

🚀 Cara Penggunaan
Memulai Transfer
sudo zturbo

Membuka Monitoring
sudo zmturbo

⚙️ Requirements
OS: Linux (Ubuntu, Debian, CentOS, RHEL).
Core: rsync (Wajib), fpart (Wajib untuk Turbo Mode).

