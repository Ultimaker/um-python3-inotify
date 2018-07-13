#!/bin/sh

set -eu

python3 setup.py --command-packages=stdeb.command bdist_deb
python3 setup.py clean

exit 0

