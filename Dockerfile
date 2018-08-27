FROM registry.hub.docker.com/library/debian:jessie-slim

LABEL Maintainer="software-embedded-platform@ultimaker.com" \
      Comment="Ultimaker python3-inotify environment"

RUN apt-get update && \
    apt-get install -q -y --no-install-recommends \
        build-essential \
        fakeroot \
        python3-all \
        python3-stdeb \
    && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

# Patch stdeb to work without python2
COPY patches/ /patches/
RUN cd "/usr/lib/python3/dist-packages/" && \
    patch -p1 < /patches/0001-Support-running-without-python-all-with-python3-only.patch

COPY tests/ /tests/
