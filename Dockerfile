FROM registry.hub.docker.com/library/debian:jessie-slim

LABEL Maintainer="software-embedded-platform@ultimaker.com" \
      Comment="Ultimaker python3-inotify environment"

RUN apt-get update && \
    apt-get install -q -y --no-install-recommends \
        build-essential \
        fakeroot \
        python-all \
        python3-all \
        python3-stdeb \
    && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

COPY tests/ /tests/
