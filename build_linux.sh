#!/usr/bin/env bash
set -euo pipefail

pushd linux
  make olddefconfig
  make -j $(nproc) $*
popd
