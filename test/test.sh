#!/bin/sh
set -e

. venv/bin/activate

pip install zeroc_ice*manylinux*whl
python -c 'import Ice; print Ice.stringVersion()'
