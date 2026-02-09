# 🚀 ZTURBO - High Performance Data Transfer Engine

![Version](https://img.shields.io/badge/version-1.3.1%20(Polished)-blue.svg?style=flat-square)
![Platform](https://img.shields.io/badge/platform-Linux-green.svg?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-orange.svg?style=flat-square)

**ZTURBO** adalah toolkit *Command Line Interface (CLI)* kelas Enterprise yang dirancang untuk migrasi data skala besar (Big Data) pada infrastruktur High-Performance (seperti Router Mikrotik CCR1072, Server 10G/40G).

Toolkit ini menggabungkan keandalan `rsync` dengan kecepatan `fpsync` dalam arsitektur *Hybrid Parallelism*, dibungkus dengan antarmuka modern dan mekanisme keamanan berlapis.

---

## 🔥 Fitur Utama (V1.3.1)

### 1. Robust & Resilient (Anti-Gagal)
*   **🛡️ Auto-Retry Mechanism**: Otomatis mencoba ulang (3x) jika terjadi *packet loss* atau gangguan jaringan sesaat.
*   **⏱️ Smart Timeout**: Mendeteksi koneksi "zombie" dan meresetnya otomatis untuk mencegah beban pada Router.
*   **💾 Pre-Flight Check**: Menghitung sisa ruang disk tujuan sebelum transfer dimulai untuk mencegah *disk full error*.
*   **⌨️ Smart Input**: Mendukung navigasi keyboard penuh (Backspace, Arrow keys) di semua menu interaktif.

### 2. Hybrid Parallel Engine
*   **🚀 Files**: Dijalankan secara **Paralel (Background)**. Memenuhi bandwidth jaringan secara instan.
*   **📂 Folders**: Dijalankan dengan `fpsync` (Multi-thread partisi).
*   **🏎️ Optimized Flags**: Mendukung `--sparse` (untuk VM image), `-W` (Whole File), dan `--inplace` untuk kecepatan maksimal.

### 3. Modern Monitoring (ZMTURBO)
*   **📊 Unicode Dashboard**: Tampilan progress bar modern (Solid Blocks) yang elegan.
*   **👁️ Task Focus**: Menampilkan ringkasan *Source -> Dest* untuk pelacakan transfer yang lebih jelas.
*   **⚡ Anti-Flicker**: Rendering layar yang halus tanpa kedip (stabil seperti `htop`).
*   **📉 Resource Guard**: Memantau CPU Load & RAM secara *real-time* untuk mencegah server hang.

---

## 🆚 Mode Operasi: Kapan Pakai Apa?

ZTURBO memiliki dua "kepribadian" yang bisa dipilih sesuai situasi:

| Fitur | 🛡️ MODE SAFE (Default) | 🚀 MODE TURBO |
| :--- | :--- | :--- |
| **Filosofi** | "Lambat asal Selamat & Sopan" | "Gas Pol Rem Blong" |
| **Kecepatan** | Sequential (Satu per satu) | Hybrid Parallel (Multi-Thread) |
| **Prioritas** | Low Priority (`nice`/`ionice`) | High Priority (Max Resource) |
| **Metode Tulis** | Atomic (File Temp -> Rename) | In-Place (Langsung Tulis) |
| **CPU Usage** | Rendah (Hitung Delta/Perbedaan) | Rendah (Whole File Streaming) |
| **Cocok Untuk** | **Jam Kerja**, Sync Harian, Koneksi Lambat | **Migrasi Awal**, Akhir Pekan, Network 10G+ |
| **Resume** | Supported (via Partial Dir) | Supported (via In-Place Check) |

---

## 📦 Instalasi

1.  **Clone Repository**
    ```bash
    git clone https://github.com/ddt-mmt/zturbo.git
    cd zturbo
    ```

2.  **Jalankan Installer**
    ```bash
    chmod +x install.sh
    sudo ./install.sh
    ```
    *Script otomatis menginstall `rsync`, `fpart`, dan membuat symlink ke `/usr/local/bin`.*

---

## 🚀 Cara Penggunaan

### 1. Memulai Transfer (ZTURBO)
Cukup ketik `zturbo` di terminal. Wizard interaktif akan memandu Anda:

```bash
zturbo
```

**Fitur Baru di Wizard:**
*   **Rich Browser**: Menampilkan ukuran file/folder secara langsung.
*   **Storage Info**: Menampilkan total ukuran data vs sisa disk tujuan.
*   **Smart Selection**: Bisa memilih multiple file & folder sekaligus.

### 2. Monitoring (ZMTURBO)
Buka terminal baru dan ketik:

```bash
zmturbo
```

**Tampilan Dashboard V1.3.1:**
```text
=== ZMTURBO V1.3 (OPTIMIZED): MONITORING CENTER ===
HOST : server-prod-01 | IP: 10.10.1.5 | USER: root
STATS: CPU Load: 1.25 | RAM: 4500MB (15%) | IO: 0%

[ A. ACTIVE TRANSFERS ]
PID     USER     CPU%   SPEED        ETA          PROGRESS                     TASK (Source -> Dest)
--------------------------------------------------------------------------------------------------
8821    root     12.5   145.2MB/s    02m10s       ██████████░░░░░░░░░░ 50%     big_vm.qcow2 -> backup_san
9012    admin    5.0    40.5MB/s     05m00s       ████░░░░░░░░░░░░░░░░ 20%     web_data -> /mnt/nas01
--------------------------------------------------------------------------------------------------
```

---

## 🔧 Troubleshooting

*   **Peringatan "Dependencies Missing"**:
    Pastikan `rsync` dan `fpart` terinstall.
    ```bash
    apt install rsync fpart   # Debian/Ubuntu
    yum install rsync fpart   # CentOS/RHEL
    ```

*   **Server Terasa Berat**:
    Jika menggunakan Mode TURBO pada HDD biasa (bukan SSD), kurangi jumlah thread di menu konfirmasi (Opsi `[4]`) menjadi 4-8 thread.

---

## 🤝 Kontribusi & Lisensi

Dibuat dengan ❤️ untuk komunitas SysAdmin & Network Engineer.
Dilisensikan di bawah **MIT License**.

Pull Request sangat diterima untuk pengembangan fitur lebih lanjut!
