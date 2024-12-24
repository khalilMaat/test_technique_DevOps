FROM debian:buster AS builder

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

FROM debian:buster-slim

WORKDIR /data

COPY --from=builder /data/tomcat_test.sh /data/tomcat_test.sh
COPY --from=builder /data/tomcat_deploy.yml /data/tomcat_deploy.yml

RUN apt-get update -y && \
    apt-get install -y ansible curl python3



EXPOSE 8080

ENTRYPOINT ["tail","-f","/dev/null"]

