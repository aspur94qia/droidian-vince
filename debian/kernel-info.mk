KERNEL_ARCH = arm64
DEB_ARCH = arm64

# Sesuaikan dengan nama defconfig di source kernel Anda
KERNEL_DEFCONFIG = vince_defconfig

# Diambil langsung dari log bootloader asli Vince yang Anda kirimkan
KERNEL_CMDLINE = console=tty0,114000n8 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78af000 loop.max_part=16 androidboot.usbconfigfs=true buildvariant=userdebug
KERNEL_BASE = 0x00000000
KERNEL_PAGESIZE = 2048
KERNEL_TAGS_OFFSET = 0x00000100
KERNEL_RAMDISK_OFFSET = 0x01000000
