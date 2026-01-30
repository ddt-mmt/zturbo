# 🚀 ZTURBO - High Performance Data Transfer Engine

**ZTURBO** adalah TUI (Text User Interface) wrapper yang cerdas untuk `rsync` dan `fpsync`. Dirancang khusus untuk memindahkan data dalam jumlah besar (Big Data) antar server Linux dengan efisiensi tinggi.

> **Status:** Production Ready (v1.3)
> **Engine:** Hybrid (Rsync + Fpsync)

---

## ✨ Fitur Utama

* **⚡ Mode Hybrid:**
    * **SAFE MODE:** Menggunakan standard `rsync` (aman untuk jam kerja).
    * **TURBO MODE:** Menggunakan `fpsync` multi-threading (ngebut untuk maintenance).
* **🛒 Multi-Select Batch:** Pilih banyak file/folder sekaligus untuk dikirim.
* **🧠 Smart Resume:** Otomatis melanjutkan transfer yang terputus.
* **🛡️ Integrity Check:** Verifikasi otomatis Byte-count & File-count.
* **🧟 Zombie Slayer:** Monitor (ZMTURBO) mampu membunuh proses macet hingga ke akarnya.

---

## 📸 Tampilan (Preview)

### 1. Menu Transfer (ZTURBO)
Tampilan saat memilih file dengan fitur Multi-Select.

```text
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

📦 Instalasi
Clone Repository:

Bash
git clone [https://github.com/ddt-mmt/zturbo.git](https://github.com/ddt-mmt/zturbo.git)
cd zturbo
Jalankan Installer:

Bash
chmod +x install.sh
sudo ./install.sh
Selesai!

Transfer: zturbo

Monitor: zmturbo

⚙️ Persyaratan
OS: Linux (Ubuntu/Debian/CentOS).

Tools: rsync, fpart (wajib untuk Turbo Mode).

🤝 Lisensi
MIT License - Created by Didit.
