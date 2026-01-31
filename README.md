# 🚀 ZTURBO - High Performance Data Transfer Engine

![Version](https://img.shields.io/badge/version-1.1%20(Dev)-blue.svg?style=flat-square)
![Platform](https://img.shields.io/badge/platform-Linux-green.svg?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-orange.svg?style=flat-square)
![Maintenance](https://img.shields.io/badge/maintenance-Active-success.svg?style=flat-square)

**ZTURBO** adalah toolkit *Command Line Interface (CLI)* canggih yang dirancang untuk mempercepat dan mempermudah proses migrasi data skala besar (Big Data) antar server atau direktori. Toolkit ini menggabungkan kekuatan `rsync` dan `fpsync` dengan antarmuka yang ramah pengguna serta sistem monitoring yang tangguh.

---

## 🔥 Fitur Unggulan

### 1. ZTURBO (The Engine)
*   **⚡ Hybrid Architecture**: Secara cerdas menangani transfer file kecil maupun besar.
*   **🛒 Multi-Select Interface**: Memungkinkan pengguna memilih beberapa file atau folder sekaligus dari sumber yang berbeda sebelum memulai transfer.
*   **🛡️ Parallel Verification**: Melakukan verifikasi data (Source vs Destination) secara paralel untuk memastikan integritas data tanpa mengorbankan waktu.
*   **📝 Automated Reporting**: Menghasilkan laporan detail (TXT) untuk setiap pekerjaan transfer, tersimpan rapi di `/tmp/zturbo_reports`.
*   **🛑 Safety First**: Dilengkapi dengan mekanisme "Safe Mode" dan penanganan sinyal (Ctrl+C) yang membersihkan file sementara secara otomatis.

### 2. ZMTURBO (The Monitor)
*   **📊 Real-time Dashboard**: Memantau penggunaan CPU, RAM, dan Load Average server secara langsung.
*   **🧟 Zombie Slayer**: Fitur keamanan tingkat lanjut yang mampu mendeteksi dan mematikan proses "zombie" atau proses yang macet hingga ke akarnya (menggunakan Process Group ID).
*   **📉 Smart Resource Calculation**: Menghitung kapasitas aman server (Safe Pool) berdasarkan RAM yang tersedia untuk mencegah *server crash* akibat overload.
*   **👁️ Granular Visibility**: Melihat detail setiap job transfer: PID, User, CPU Usage per job, RAM Usage, dan Progress Bar visual.

---

## ⚙️ Prasyarat Sistem (Requirements)

Sebelum menggunakan ZTURBO, pastikan server Anda memiliki paket berikut:

*   **OS**: Linux (Ubuntu, Debian, CentOS, RHEL).
*   **Core Utils**: `rsync`, `awk`, `grep`, `ps`, `free`.
*   **Optional (untuk Turbo Mode)**: `fpart`, `fpsync`.

Untuk menginstal dependensi pada Ubuntu/Debian:
```bash
sudo apt update
sudo apt install rsync fpart
```

---

## 📦 Instalasi

1.  **Clone Repository**
    ```bash
    git clone https://github.com/ddt-mmt/zturbo.git
    cd zturbo
    ```

2.  **Berikan Izin Eksekusi**
    ```bash
    chmod +x zturbo zmturbo
    ```

---

## 🚀 Panduan Penggunaan

### 1. Menjalankan Transfer (ZTURBO)

Jalankan script `zturbo` untuk memulai wizard transfer data.

```bash
./zturbo
```

**Tampilan Antarmuka:**

```text
==========================================
       ZTURBO - DEV OPTIMIZED ENGINE      
==========================================
👤 USER: root | 🌐 IP: 192.168.1.10 | 💾 MODE: SAFE
------------------------------------------
[ STEP 1 ] SELECT SOURCE LOCATION
 [0] 🏠 HOME DIR (/root)
 [1] 🌳 ROOT DIR (/root)
 [2] 📂 /mnt/data
     └─ 🔗 Source: /dev/sdb1

------------------------------------------
[Number] Select | [R] Refresh | [Q] Quit
------------------------------------------
 👉 INPUT > 
```

**Langkah-langkah:**
1.  **Pilih Lokasi Awal**: Pilih drive atau folder induk.
2.  **Browse & Select**: Navigasi folder dan gunakan tombol `[Space]` atau masukkan nomor untuk memilih (checklist) folder/file yang ingin dikirim.
3.  **Finalisasi**: Ketik `d` (Done) saat selesai memilih.
4.  **Pilih Tujuan**: Tentukan folder tujuan transfer.
5.  **Konfirmasi**: Review ringkasan dan mulai transfer.

---

### 2. Monitoring (ZMTURBO)

Jalankan script `zmturbo` di terminal terpisah untuk memantau proses yang berjalan.

```bash
./zmturbo
```

**Tampilan Dashboard:**

```text
=== ZMTURBO V1.1 (DEV): MONITORING CENTER ===
HOST: vm-kali-02 | IP: 192.168.1.10 | LOGIN: root
HEALTH: CPU Load: 0.45 | RAM: 1540MB / 8000MB (19%)
CAPACITY: Max Threads: 106 (Safe Pool) | OS Guard: 1600MB (Reserved)

[ A. ACTIVE TRANSFERS ]
PID     USER    CPU%   RAM(MB)  PROGRESS           SIZE     DESTINATION
--------------------------------------------------------------------------
1823    root    12.5   45MB     [####..........]   1.2G     /mnt/backup/2024
1890    admin   5.0    20MB     [#######.......]   500M     /var/www/html

--------------------------------------------------------------------------
[K] Kill Process | [Q] Quit Monitor
--------------------------------------------------------------------------
 👉 INPUT > 
```

**Fitur Kontrol:**
*   **[K] Kill Process**: Memasukkan menu untuk menghentikan paksa transfer tertentu (misal: jika macet atau salah kirim). Sistem akan mematikan seluruh *process group* terkait untuk mencegah proses zombie.
*   **[Q] Quit**: Keluar dari dashboard monitoring.

---

## 🔧 Konfigurasi Lanjutan

Anda dapat mengubah variabel konfigurasi di bagian atas script `zturbo` dan `zmturbo` sesuai kebutuhan server Anda:

**File `zturbo`:**
```bash
FILES_PER_JOB=2500        # Jumlah file per batch (untuk fpart/rsync)
CURRENT_MODE="SAFE"       # Mode default
```

**File `zmturbo`:**
```bash
REFRESH_RATE=2            # Interval refresh dashboard (detik)
```

---

## 📁 Struktur Project

- `zturbo`: Engine utama (Versi Optimized).
- `zmturbo`: Dashboard monitoring (Versi Optimized).
- `base-script/`: Folder berisi script dasar atau versi alternatif.
- `install.sh`: Script instalasi otomatis.
- `README.md`: Dokumentasi project.

---

## 🤝 Kontribusi

Pull Request sangat diterima. Untuk perubahan besar, harap buka issue terlebih dahulu untuk mendiskusikan apa yang ingin Anda ubah.

1.  Fork project ini
2.  Buat feature branch (`git checkout -b feature/AmazingFeature`)
3.  Commit perubahan Anda (`git commit -m 'Add some AmazingFeature'`)
4.  Push ke branch (`git push origin feature/AmazingFeature`)
5.  Buka Pull Request
