# 🚀 ZTURBO - High Performance Data Transfer Engine

**ZTURBO** adalah TUI (Text User Interface) wrapper yang cerdas untuk \`rsync\` dan \`fpsync\`. Dirancang khusus untuk memindahkan data dalam jumlah besar (Big Data) antar server Linux dengan efisiensi tinggi, dilengkapi dengan sistem monitoring real-time dan fitur keamanan proses.

> **Status:** Production Ready (v1.3)
> **Engine:** Hybrid (Rsync + Fpsync)

---

## ✨ Fitur Utama

* **⚡ Mode Hybrid:**
    * **SAFE MODE:** Menggunakan standard \`rsync\` dengan limitasi resource (cocok untuk jam kerja).
    * **TURBO MODE:** Menggunakan \`fpsync\` multi-threading untuk menghabiskan bandwidth yang tersedia (cocok untuk window maintenance).
* **🛒 Multi-Select Batch:** Pilih banyak file dan folder sekaligus (sistem keranjang/checklist) untuk dikirim dalam satu kali proses.
* **🧠 Smart Resume:** Otomatis melanjutkan transfer yang terputus.
* **🛡️ Integrity Check:** Verifikasi otomatis di akhir proses (Byte-count & File-count audit).
* **🧟 Zombie Slayer (ZMTURBO):** Monitor yang mampu membunuh proses macet hingga ke akarnya (Process Group ID).

---

## 📸 Tutorial & Tampilan

### 1. ZTURBO (Engine Transfer)

Jalankan perintah \`sudo zturbo\`. Anda akan disuguhkan menu interaktif.

**Langkah 1: Multi-Select Source**
Gunakan \`s <nomor>\` untuk memilih file/folder, atau \`a\` untuk Select All.

\`\`\`text
==========================================
       ZTURBO - DATA TRANSFER ENGINE      
==========================================
[ BROWSE SOURCE ] /mnt/data/Project_Alpha
✅ Selected Items: 2

 [ ] [1] 📁 2023_Backup/
 [*] [2] 📁 2024_Backup/      <-- Terpilih (Folder)
 [ ] [3] 📁 Images/
 [*] [4] 📄 config.yaml       <-- Terpilih (File)

------------------------------------------
 [Num] Enter Folder | [s Num] Toggle | [d] Done
------------------------------------------
 👉 INPUT > d
\`\`\`

**Langkah 2: Konfirmasi Final**
Review apa saja yang akan dikirim sebelum eksekusi.

\`\`\`text
[ FINAL CONFIRMATION ]

 [1] SOURCE  : 
     - /mnt/data/Project_Alpha/2024_Backup/
     - /mnt/data/Project_Alpha/config.yaml
 [2] DEST    : /mnt/backup_server/Daily/
 [3] FOLDER  : . (Default: Current Dir)
 [4] THREADS : 22 (TURBO MODE)
 [5] MODE    : TURBO

 ⚠️  To START, Type 'OK' and Press Enter.
\`\`\`

---

### 2. ZMTURBO (Monitoring Center)

Jalankan perintah \`sudo zmturbo\` di terminal terpisah untuk memantau trafik.

**Dashboard Monitoring**
Melihat progress bar, penggunaan CPU/RAM per job, dan status kesehatan server.

\`\`\`text
=== ZMTURBO V1.1: MONITORING CENTER ===
HOST: Server-JKT | IP: 10.28.12.105 | LOGIN: admin
HEALTH: CPU Load: 2.45 | RAM: 12GB / 64GB (18%)

[ A. ACTIVE TRANSFERS ]
PID     USER     CPU%  MEM%  PROGRESS          SIZE     DESTINATION
--------------------------------------------------------------------------
45120   didit    85%   2.1%  [#######.......]  45.2GB   .../2024_Backup
45199   root     12%   0.5%  [#############.]  1.2GB    .../SysLog

[ B. STORAGE STATUS ]
MOUNT                SIZE      FREE      SOURCE
/mnt/data            10T       2.4T      /dev/sdb1
/mnt/backup          50T       41T       192.168.1.20:/volume1

[R] REFRESH | [K] KILL MENU | [H] HISTORY TABLE | [Q] QUIT
\`\`\`

---

## 📦 Instalasi

1.  **Clone Repository:**
    \`\`\`bash
    git clone https://github.com/ddt-mmt/zturbo.git
    cd zturbo
    \`\`\`

2.  **Jalankan Installer (Otomatis):**
    \`\`\`bash
    chmod +x install.sh
    sudo ./install.sh
    \`\`\`

3.  **Selesai!** Jalankan langsung:
    * Transfer: \`zturbo\`
    * Monitor: \`zmturbo\`

---

## ⚙️ Persyaratan Sistem

* **OS:** Linux (Ubuntu, Debian, CentOS, RHEL, AlmaLinux).
* **Dependencies:** \`rsync\`, \`fpart\` (wajib untuk mode Turbo).
* **Hardware:** Disarankan minimal 2 Core CPU untuk multitasking efektif.

---

## 🤝 Kontribusi & Lisensi

Dibuat dengan ❤️ oleh **Didit** untuk kebutuhan operasional High-Performance Computing.
Lisensi: **MIT License**.
