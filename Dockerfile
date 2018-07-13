FROM registry.hub.docker.com/library/debian:jessie-slim

LABEL Maintainer="software-embedded-platform@ultimaker.com" \
      Comment="Ultimaker python3-inotify environment"

RUN apt-get update && \
    apt-get install -q -y --no-install-recommends \
	build-essential \
	fakeroot \
    python-all \
    python3-all \
    python3-stdeb && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

# Copy all files required for testing the build environment
COPY tests/buildenv.sh /tests/buildenv.sh
COPY tests/setup.py /tests/setup.py
COPY tests/MANIFEST.in /tests/MANIFEST.in
COPY tests/py3_only_pkg/__init__.py /tests/py3_only_pkg/__init__.py
COPY tests/py3_only_pkg/py3_module.py /tests/py3_only_pkg/py3_module.py
COPY tests/py3_only_pkg/README.rst /tests/py3_only_pkg/README.rst

