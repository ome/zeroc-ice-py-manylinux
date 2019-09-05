#!/bin/sh
set -e

. venv/bin/activate

python --version
pip --version
pip install zeroc_ice*manylinux*whl
python -c 'import Ice; print(Ice.stringVersion())'
