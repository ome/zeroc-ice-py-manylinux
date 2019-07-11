#!/bin/sh

if [ $# -ne 2 ]; then
    echo USAGE: $0 PYTHON-VERSION ICE-VERSION
    echo Available Python versions:
    ls /opt/python
    exit 1
fi

set -eux

PYTHON="$1"
ICE_VERSION="$2"

PIP=/opt/python/$PYTHON/bin/pip
BUILD_FLAGS="--global-option=build_ext --global-option=-L/usr/local/ssl/lib/ --global-option=-I/usr/local/ssl/include"

$PIP download "zeroc-ice==$ICE_VERSION"
tar -zxf "zeroc-ice-$ICE_VERSION.tar.gz"
$PIP wheel ./zeroc-ice-$ICE_VERSION -w output $BUILD_FLAGS
auditwheel repair --plat manylinux2010_x86_64 output/zeroc_ice-* -w output/
cp output/zeroc_ice*manylinux*whl /dist/
