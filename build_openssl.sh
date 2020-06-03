#!/bin/sh
# Get openssl build scripts from
# https://github.com/pypa/manylinux/tree/$MANYLINUX_COMMIT

set -eux

MANYLINUX_COMMIT=c06f15c8c8fddebd22defdca2ecada91386f09f4

curl -sfLO https://raw.githubusercontent.com/pypa/manylinux/$MANYLINUX_COMMIT/docker/build_scripts/build_env.sh
curl -sfLO https://raw.githubusercontent.com/pypa/manylinux/$MANYLINUX_COMMIT/docker/build_scripts/build_utils.sh

source /manylinux-scripts/build_env.sh
source /manylinux-scripts/build_utils.sh
build_openssl $OPENSSL_ROOT $OPENSSL_HASH
