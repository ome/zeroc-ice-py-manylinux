#!/bin/sh
# Get openssl build scripts from
# https://github.com/pypa/manylinux/tree/$MANYLINUX_COMMIT

set -eux

MANYLINUX_COMMIT=a3fe4ea166275c7321d2ad9516c2a7a62d59b402

curl -sfLO https://raw.githubusercontent.com/pypa/manylinux/$MANYLINUX_COMMIT/docker/build_scripts/build_env.sh
curl -sfLO https://raw.githubusercontent.com/pypa/manylinux/$MANYLINUX_COMMIT/docker/build_scripts/build_utils.sh

source /manylinux-scripts/build_env.sh
source /manylinux-scripts/build_utils.sh
build_openssl $OPENSSL_ROOT $OPENSSL_HASH
