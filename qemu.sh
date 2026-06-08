#!/usr/bin/env bash
set -euo pipefail

qemu-system-x86_64 -nographic \
  -kernel linux/arch/x86_64/boot/bzImage \
  -drive format=raw,file=buildroot/output/images/rootfs.ext2,if=virtio \
  -append "root=/dev/vda console=ttyS0 nokaslr" \
  -m 4G \
  -smp 2 \
  -net nic,model=virtio \
  -net user,hostfwd=tcp::10022-:22
