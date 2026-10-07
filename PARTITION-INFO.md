# Vince Partition Layout

## Partisi Original
- boot (64MB) -> Android kernel
- system (3GB) -> Android system
- vendor (512MB) -> Android vendor
- data (11GB) -> Android userdata
- cache (256MB) -> Android cache
- recovery -> Recovery image
- misc -> Bootloader misc

## Partisi Setelah Flash Droidian
- boot -> Halium kernel (diganti)
- system -> Android 13 (TETAP AMAN)
- vendor -> Android vendor (tetap)
- data -> Droidian system (diganti)
- cache -> Android cache (tetap)
- recovery -> Recovery (tetap)
- misc -> Bootloader misc (tetap)

## Keuntungan
✓ Android 13 tidak terhapus
✓ Hanya kernel dan /data diganti
✓ Bisa restore Android dari backup
✓ Relatif aman untuk dual boot

## Switch OS
- Ke Droidian: Reboot normal
- Ke Android: Boot recovery + restore backup
