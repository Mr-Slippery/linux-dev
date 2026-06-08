#!/usr/bin/env bash
set -euo pipefail

pushd buildroot
  make -j $(nproc)
popd
