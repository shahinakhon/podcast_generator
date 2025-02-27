FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y \
    apt-utils \
    python3.12 \
    python3.12-venv \
    python3.12-dev \
    python3-pip \
    curl \
    git && \
    apt-get clean

# Ensure pip is installed and upgrade it
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12

# Use python3.12 explicitly for installing packages
RUN python3.12 -m pip install --upgrade pip && python3.12 -m pip install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
