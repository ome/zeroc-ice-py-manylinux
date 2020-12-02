#!/bin/sh
# Get openssl build scripts from
# https://github.com/pypa/manylinux/tree/$MANYLINUX_COMMIT

set -eux

MANYLINUX_COMMIT=201fb799794d50449f8c0e37795818768433991b

curl -sfLO https://raw.githubusercontent.com/pypa/manylinux/$MANYLINUX_COMMIT/docker/build_scripts/build_env.sh
curl -sfLO https://raw.githubusercontent.com/pypa/manylinux/$MANYLINUX_COMMIT/docker/build_scripts/build_utils.sh

source /manylinux-scripts/build_env.sh
source /manylinux-scripts/build_utils.sh
build_openssl $OPENSSL_ROOT $OPENSSL_HASH
