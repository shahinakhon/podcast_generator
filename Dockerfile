FROM ubuntu:latest

# Install Python 3.12, pip, and other dependencies in one command
RUN apt-get update && apt-get install -y \
    python3.12 \
    python3-pip \
    git && \
    apt-get clean

# Install PyYAML without upgrading pip
RUN python3.12 -m pip install --break-system-packages PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]