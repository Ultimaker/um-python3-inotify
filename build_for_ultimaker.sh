#!/bin/sh

SRC_PATH="$(pwd)"
MODULE_PATH="$(pwd)/inotify"

init() {
	git submodule update --init --recursive
        # ugly hack to remove nose , which is a test only dependency.
        truncate -s 0 ${MODULE_PATH}/requirements.txt
}

build() {
	cd "${MODULE_PATH}" &&
	python3 setup.py --command-packages=stdeb.command bdist_deb &&
	cp deb_dist/python3-inotify_*.deb "${SRC_PATH}/"
	cd "${SRC_PATH}"
}

init
build
