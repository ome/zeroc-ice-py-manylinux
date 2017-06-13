#!/bin/sh

set -eu

ICE_VERSION="$1"
pip download "zeroc-ice==$ICE_VERSION"
tar -zxf "zeroc-ice-$ICE_VERSION.tar.gz"
cd "zeroc-ice-$ICE_VERSION"
python setup.py bdist_wheel bdist_rpm
cp dist/* /dist/
