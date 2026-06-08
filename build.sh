#!/usr/bin/env bash
set -euo pipefail

./build_linux.sh $*
./build_rootfs.sh $*
