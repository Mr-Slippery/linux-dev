#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. "${SCRIPT_DIR}"/config.sh

CONTAINER=linux-dev

pushd "${SCRIPT_DIR}"/..

if [ -f ./buildroot/.config ]; then
  cp ./buildroot/.config ./buildroot/.config.bak
fi
cp buildroot.config ./buildroot/.config

if [ -f ./linux/.config ]; then
  cp ./linux/.config ./linux/.config.bak
fi
cp linux.config ./linux/.config

docker run --device /dev/kvm \
           -it \
           --rm \
           --name "${CONTAINER}" \
           -v "$(pwd)":"$(pwd)":Z \
           -w "$(pwd)" \
           "${IMAGE}"
popd
