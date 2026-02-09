# 🚀 ZTURBO - High Performance Data Transfer Engine

![Version](https://img.shields.io/badge/version-1.3%20(Stable)-green.svg?style=flat-square)
![Platform](https://img.shields.io/badge/platform-Linux-green.svg?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-orange.svg?style=flat-square)

**ZTURBO** adalah toolkit *Command Line Interface (CLI)* canggih yang dirancang untuk mempercepat dan mempermudah proses migrasi data skala besar (Big Data) antar server atau direktori. Toolkit ini menggabungkan kekuatan `rsync` dan `fpsync` dengan antarmuka yang ramah pengguna serta sistem monitoring yang tangguh.

---

## 🔥 Fitur Unggulan (V1.3 Optimized)

### 1. ZTURBO (The Engine)
*   **⚡ Hybrid Architecture**: Secara cerdas menangani transfer file kecil maupun besar.
*   **🛒 O(1) Map Selection**: Menggunakan *Associative Array* untuk pemilihan file yang instan meskipun di dalam folder berisi ribuan item.
*   **📄 Smart Pagination**: Interface browser file kini dilengkapi navigasi halaman (Next/Prev) untuk menangani direktori besar dengan rapi.
*   **🛡️ Parallel Verification**: Melakukan verifikasi data (Source vs Destination) secara paralel untuk memastikan integritas data.
*   **📝 Automated Reporting**: Menghasilkan laporan detail (TXT) untuk setiap pekerjaan transfer.

### 2. ZMTURBO (The Monitor)
*   **📊 Low-Overhead Dashboard**: Optimasi *string processing* murni (tanpa subshell) sehingga sangat ringan di CPU.
*   **🧟 Zombie Slayer**: Fitur keamanan tingkat lanjut yang mampu mendeteksi dan mematikan proses yang macet hingga ke akarnya.
*   **📉 Capacity Guard**: Menghitung batas aman (Safe Pool) berdasarkan RAM yang tersedia secara otomatis.

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

2.  **Jalankan Installer** (Otomatis install dependency & setup path)
    ```bash
    chmod +x install.sh
    sudo ./install.sh
    ```
    
    *Script ini akan memindahkan `zturbo` dan `zmturbo` ke `/usr/local/bin/` sehingga bisa dipanggil dari folder mana saja.*

3.  **Selesai!**
    Langsung ketik perintah berikut dari terminal mana pun:
    *   `zturbo` : Untuk memulai transfer.
    *   `zmturbo` : Untuk monitoring.

---

## 🚀 Panduan Penggunaan

### 1. Menjalankan Transfer (ZTURBO)

Jalankan perintah `zturbo` untuk memulai wizard transfer data.

```bash
zturbo
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

Jalankan perintah `zmturbo` di terminal terpisah untuk memantau proses yang berjalan.

```bash
zmturbo
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
