# Terbitkan situs https://cekhp.acehgadaisyariah.com (GitHub Pages, cabang gh-pages).
# Isi: tes/ ios/ apk/ apk32/ index.html + FILE APK nasabah dari D:\cek-android\dist
# (APK ikut di situs supaya alamat unduh = domain sendiri, bukan github.com).
# Cabang gh-pages ditulis ulang TANPA riwayat setiap terbit (orphan + force push) agar repo
# tidak membengkak 25 MB per rilis. Sumber tetap di cabang main.
# Jalankan setelah D:\cek-android\app\build-apk.ps1:
#   powershell -ExecutionPolicy Bypass -File .\publish-site.ps1
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$dist = 'D:\cek-android\dist'
$apk64 = Join-Path $dist 'CekHPNasabah.apk'
$apk32 = Join-Path $dist 'CekHPNasabah-arm32.apk'
foreach ($f in @($apk64, $apk32)) {
  if (-not (Test-Path $f)) { throw "Tidak ada: $f (jalankan D:\cek-android\app\build-apk.ps1 dulu)" }
}
$remote = (git remote get-url origin).Trim()
$site = Join-Path $env:TEMP ('cekhp-site-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Force $site | Out-Null
foreach ($d in @('tes', 'ios', 'apk', 'apk32')) { Copy-Item $d (Join-Path $site $d) -Recurse -Force }
Copy-Item 'index.html' $site -Force
Copy-Item $apk64 (Join-Path $site 'apk\CekHPNasabah.apk') -Force
Copy-Item $apk32 (Join-Path $site 'apk32\CekHPNasabah-arm32.apk') -Force
Set-Content -Path (Join-Path $site 'CNAME') -Value 'cekhp.acehgadaisyariah.com' -Encoding ascii -NoNewline
New-Item -ItemType File -Force (Join-Path $site '.nojekyll') | Out-Null

$mb = [math]::Round((Get-Item $apk64).Length / 1MB, 1)
$stamp = (Get-Item $apk64).LastWriteTime.ToString('yyyy-MM-dd HH:mm')
Push-Location $site
try {
  git init -q
  git checkout -q -b gh-pages
  git add -A
  git -c user.name=namasayafendy -c user.email=namasayafendy@gmail.com commit -q -m "situs cekhp $stamp (APK nasabah $mb MB)"
  git push --force $remote gh-pages:gh-pages
} finally {
  Pop-Location
  Remove-Item $site -Recurse -Force
}
Write-Host "OK: gh-pages diterbitkan -> https://cekhp.acehgadaisyariah.com/ (APK $mb MB). Pages butuh 1-2 menit."
