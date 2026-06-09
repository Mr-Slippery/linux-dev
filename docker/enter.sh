#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. "${SCRIPT_DIR}"/config.sh

pushd "${SCRIPT_DIR}"/..

docker exec -it \
           "${CONTAINER}" \
           /bin/bash

popd
