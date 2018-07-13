FROM registry.hub.docker.com/library/debian:stable-slim

LABEL Maintainer="software-embedded-platform@ultimaker.com" \
      Comment="Ultimaker python3-inotify environment"

RUN apt-get update && \
    apt-get install -q -y --no-install-recommends \
        python3-all \
        python3-stdeb && \
    rm -r /var/lib/apt/lists/*

COPY tests/buildenv.sh /tests/buildenv.sh
COPY tests/setup.py /tests/setup.py
