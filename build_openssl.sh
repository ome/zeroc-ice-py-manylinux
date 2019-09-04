#!/bin/sh
# Get openssl build scripts from
# https://github.com/pypa/manylinux/tree/$MANYLINUX_COMMIT

set -eux

MANYLINUX_COMMIT=4e4be4dd8f670be1c463a764b93fd84e8648c2f6

curl -sfLO https://raw.githubusercontent.com/pypa/manylinux/$MANYLINUX_COMMIT/docker/build_scripts/build_env.sh
curl -sfLO https://raw.githubusercontent.com/pypa/manylinux/$MANYLINUX_COMMIT/docker/build_scripts/build_utils.sh

source /manylinux-scripts/build_env.sh
source /manylinux-scripts/build_utils.sh
build_openssl $OPENSSL_ROOT $OPENSSL_HASH
