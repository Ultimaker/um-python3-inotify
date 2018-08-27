#!/bin/sh

set -eu

WORKDIR="$(pwd)"
MODULE_PATH="${WORKDIR}/inotify"

cd "${MODULE_PATH}"
rm -r deb_dist
rm inotify-*.tar.gz
python3 setup.py --command-packages=stdeb.command bdist_deb
cp deb_dist/python3-inotify_*.deb "${WORKDIR}/"
