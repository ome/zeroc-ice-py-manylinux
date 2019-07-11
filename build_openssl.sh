#!/bin/sh
# Get openssl build scripts from
# https://github.com/pypa/manylinux/tree/e798fbb417c0f8e776fa9de7f8b9a3424f44eaf9

set -eux

MANYLINUX_COMMIT=e798fbb417c0f8e776fa9de7f8b9a3424f44eaf9

curl -sfLO https://raw.githubusercontent.com/pypa/manylinux/$MANYLINUX_COMMIT/docker/build_scripts/build_env.sh
curl -sfLO https://raw.githubusercontent.com/pypa/manylinux/$MANYLINUX_COMMIT/docker/build_scripts/build_utils.sh

source /manylinux-scripts/build_env.sh
source /manylinux-scripts/build_utils.sh
build_openssl $OPENSSL_ROOT $OPENSSL_HASH
