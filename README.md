# Cek HP Gadai (DRPE Android) - Aceh Gadai Syariah

Situs publik: **https://cekhp.acehgadaisyariah.com** (GitHub Pages, cabang `gh-pages`, diterbitkan lewat `publish-site.ps1` — sumber ada di cabang `main`).

| Alamat | Isi |
|---|---|
| `/tes/?r=&st=` | Landing QR pemeriksaan Android: **BUKA APLIKASI** (deep link `cekhpnasabah://tes`) atau **DOWNLOAD** |
| `/apk/CekHPNasabah.apk` | Aplikasi **Cek HP Nasabah** (±25 MB, arm64) — HP nasabah, tanpa PIN/token, hapus setelah selesai |
| `/apk32/CekHPNasabah-arm32.apk` | Versi HP lama 32-bit (±21 MB) |
| `/ios/` | PWA tes iPhone (tanpa install) |

Aplikasi **Cek HP Penaksir** (HP outlet; berisi token outlet bersama) TIDAK dipublikasikan di sini — dibagikan langsung oleh owner.

APK nasabah tidak berisi rahasia apa pun. Sumber kode: repo privat `cek-android`.

Cara terbit versi baru: `D:\cek-android\app\build-apk.ps1` → `publish-site.ps1` (menyalin APK dari `D:\cek-android\dist`, menulis ulang `gh-pages` tanpa riwayat).
