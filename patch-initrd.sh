#!/bin/bash
set -eu
f=build-initrd.sh
n=$(grep -n 'update-initramfs' "$f" | head -1 | cut -d: -f1)
[ -n "$n" ] || { echo "update-initramfs tidak ada di $f"; exit 1; }
sed -i "${n}i mkdir -p \"\${ROOT}/boot\"; echo CONFIG_RD_GZIP=y > \"\${ROOT}/boot/config-touch-\${ARCH}\"" "$f"
grep -n -B3 -A3 'CONFIG_RD_GZIP' "$f"
H=$(find . -type f -path '*hooks/halium' ! -path './build/*' | head -1)
[ -n "$H" ] || { echo "hook halium tidak ditemukan"; exit 1; }
sed -i 's|^\(copy_exec .*libdl\.so\)$|\1 \|\| true|' "$H"
grep -n libdl "$H" || true
