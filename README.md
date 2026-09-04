# Cek HP Gadai (DRPE Android) - Aceh Gadai Syariah

Sejak v1.2 (September 2026) ada **DUA aplikasi**:

| Aplikasi | Untuk | Cara dapat |
|---|---|---|
| **Cek HP Nasabah** (`CekHPNasabah.apk`, ±25 MB, arm64) | HP nasabah yang mau ditaksir — tanpa PIN, tanpa token, hapus setelah selesai | Scan QR pemeriksaan dari HP penaksir dengan kamera → halaman `tes/` → tombol DOWNLOAD. Link langsung: **https://github.com/namasayafendy/gadai-hp-apk/releases/latest/download/CekHPNasabah.apk** (HP lama 32-bit: `CekHPNasabah-arm32.apk`) |
| **Cek HP Penaksir** (`CekHPPenaksir.apk`) | HP outlet — PIN, buat pemeriksaan, QR, form, foto | Dibagikan langsung oleh owner (tidak di sini) |

Halaman di repo ini:
- `tes/` — landing QR pemeriksaan Android: **BUKA APLIKASI** (deep link `cekhpnasabah://tes?r=&st=`) atau **DOWNLOAD**.
- `ios/` — PWA tes iPhone (tanpa install).

APK nasabah **tidak berisi rahasia apa pun** (tidak ada token/kredensial). Token outlet bersama hanya ada di APK penaksir.

**Aturan rilis:** setiap rilis di repo ini WAJIB melampirkan `CekHPNasabah.apk` dan `CekHPNasabah-arm32.apk` — halaman `tes/` memakai link `releases/latest`.
