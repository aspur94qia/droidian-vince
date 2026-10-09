import re, shlex
a = shlex.split(open('stock/args.txt').read())
d, i = {}, 0
while i < len(a):
    if a[i].startswith('--') and i + 1 < len(a) and not a[i+1].startswith('--'):
        d[a[i][2:]] = a[i+1]; i += 2
    else:
        i += 1
mk = open('sources/Makefile').read()
g = lambda k: re.search(r'^%s\s*=\s*(\d+)' % k, mk, re.M).group(1)
ver = '%s.%s.%s' % (g('VERSION'), g('PATCHLEVEL'), g('SUBLEVEL'))
cmd = ' '.join(t for t in d.get('cmdline', '').split() if not t.startswith('systempart'))
cmd += ' console=tty0 droidian.lvm.prefer'
L = [
 'KERNEL_BASE_VERSION = ' + ver,
 'KERNEL_DEFCONFIG = vince-perf_defconfig',
 'KERNEL_ARCH = arm64',
 'DEB_BUILD_FOR = arm64',
 'DEVICE_VENDOR = xiaomi',
 'DEVICE_MODEL = vince',
 'DEVICE_FULL_NAME = Xiaomi Redmi 5 Plus',
 'FLASH_ENABLED = 0',
 'KERNEL_BOOTIMAGE_CMDLINE = ' + cmd,
 'KERNEL_BOOTIMAGE_PAGE_SIZE = ' + d.get('pagesize', '2048'),
 'KERNEL_BOOTIMAGE_BASE_OFFSET = ' + d.get('base', '0x80000000'),
 'KERNEL_BOOTIMAGE_KERNEL_OFFSET = ' + d.get('kernel_offset', '0x00008000'),
 'KERNEL_BOOTIMAGE_INITRAMFS_OFFSET = ' + d.get('ramdisk_offset', '0x01000000'),
 'KERNEL_BOOTIMAGE_SECONDIMAGE_OFFSET = ' + d.get('second_offset', '0x00f00000'),
 'KERNEL_BOOTIMAGE_TAGS_OFFSET = ' + d.get('tags_offset', '0x00000100'),
 'KERNEL_BOOTIMAGE_VERSION = ' + d.get('header_version', '0'),
]
open('droidian/kernel-info.append', 'w').write('\n'.join(L) + '\n')
print('\n'.join(L))
