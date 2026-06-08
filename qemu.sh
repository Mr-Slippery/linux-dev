#!/usr/bin/env bash
set -euo pipefail

BZIMAGE=linux/arch/x86_64/boot/bzImage
ROOTFS=buildroot/output/images/rootfs.ext2

if [ ! -f "${BZIMAGE}" ]; then
  ./build_linux.sh
fi

if [ ! -f "${ROOTFS}" ]; then
  ./build_rootfs.sh
fi

qemu-system-x86_64 -nographic \
  -kernel "${BZIMAGE}" \
  -drive format=raw,file="${ROOTFS}",if=virtio \
  -append "root=/dev/vda console=ttyS0 nokaslr" \
  -m 4G \
  -smp 2 \
  -net nic,model=virtio \
  -net user,hostfwd=tcp::10022-:22
