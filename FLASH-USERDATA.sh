#!/bin/bash
set -e

clear
echo "╔════════════════════════════════════════════════════════╗"
echo "║    Dual Boot Setup: Android 13 + Droidian (Userdata)   ║"
echo "║         Xiaomi Redmi 5 Plus (vince)                   ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "This script will:"
echo "✓ Keep Android 13 INTACT on /system partition"
echo "✓ Install Droidian to /data partition (userdata)"
echo ""
echo "⚠️  /data akan dihapus dan diganti dengan Droidian"
echo "⚠️  Android 13 tetap aman di /system"
echo ""

read -p "Are you ready? (type 'yes' to confirm): " confirm
if [ "$confirm" != "yes" ]; then
  echo "Aborted"
  exit 0
fi

echo ""
echo "=== Step 1: Connecting to device ==="
adb devices

echo ""
echo "=== Step 2: Rebooting to bootloader ==="
adb reboot bootloader
sleep 8

echo ""
echo "=== Step 3: Checking fastboot ==="
fastboot devices

echo ""
echo "=== Step 4: Flashing halium-boot.img to /boot ==="
fastboot flash boot halium-boot.img
echo "✓ Boot partition flashed"

echo ""
echo "=== Step 5: Flashing droidian-system.img to /data ==="
fastboot flash userdata droidian-system.img
echo "✓ Userdata partition flashed"

echo ""
echo "=== Step 6: Rebooting device ==="
fastboot reboot

echo ""
echo "╔════════════════════════════════════════════════════════╗"
echo "║          Dual Boot Setup Complete!                    ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
