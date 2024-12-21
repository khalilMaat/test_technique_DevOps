FROM debian:bullseye

WORKDIR /data

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    ansible \
    curl \
    python3 \
    sshpass \
    procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /data

EXPOSE 8080
