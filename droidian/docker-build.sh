#!/bin/bash
set -ex
git config --global --add safe.directory '*'
cd /buildd/sources
apt-get update
apt-get install -y linux-packaging-snippets
mkdir -p debian/source
cp -v /usr/share/linux-packaging-snippets/kernel-info.mk.example debian/kernel-info.mk
echo "===== CONTOH kernel-info.mk ====="
cat debian/kernel-info.mk
echo "===== AKHIR CONTOH ====="
cat /droidian/kernel-info.append >> debian/kernel-info.mk
echo 13 > debian/compat
echo "3.0 (native)" > debian/source/format
printf '#!/usr/bin/make -f\n\ninclude /usr/share/linux-packaging-snippets/kernel-snippet.mk\n\n%%:\n\tdh $@\n' > debian/rules
chmod +x debian/rules
rm -f debian/control
debian/rules debian/control
RELENG_HOST_ARCH="arm64" releng-build-package
