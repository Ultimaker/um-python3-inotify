FROM registry.hub.docker.com/library/debian:stable-slim

LABEL Maintainer="r.siudak@ultimaker.com" \
      Comment="Ultimaker python3-inotify environment"

RUN apt-get update && \
    apt-get install -y \
    python3-stdeb \
    python-all

COPY tests/buildenv.sh /tests/buildenv.sh
