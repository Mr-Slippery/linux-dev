#!/usr/bin/env bash
set -euo pipefail

pushd linux
  make olddefconfig
  make -j $(nproc)
popd

pushd buildroot
  make -j $(nproc)
popd
