# Droidian Build for Xiaomi Redmi 5 Plus (vince)

## Dual Boot Setup
- Android 13 tetap di /system (AMAN)
- Droidian di /data partition

## Workflow
1. Push semua file ke GitHub
2. Buka GitHub Actions
3. Jalankan: "Build Halium for Vince - Flash to Userdata"
4. Tunggu sampai build selesai
5. Download artifacts
6. Extract ZIP
7. Jalankan: ./FLASH-USERDATA.sh

## Files
- `.github/workflows/build-halium-vince-userdata.yml` - Build workflow
- `FLASH-USERDATA.sh` - Flash script
- `README.md` - Panduan

## Penting
- Backup data sebelum flash
- Bootloader harus unlocked
- Halium akan mengganti kernel di /boot saja
- /data akan dihapus
- /system Android tetap aman

## Troubleshooting
Kalau error, cek:
- Bootloader status: `adb reboot bootloader`
- Koneksi fastboot: `fastboot devices`
- Partisi: `adb shell cat /proc/partitions`
