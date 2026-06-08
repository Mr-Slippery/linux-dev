#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. "${SCRIPT_DIR}"/config.sh

docker build \
       --tag "${IMAGE}" \
       --build-arg GID=$(id -g) \
       --build-arg UID=$(id -u) \
       --build-arg USERNAME=$USER \
       "${SCRIPT_DIR}"
