FROM openjdk:8
MAINTAINER maksim@nightbook.info

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests  -y ca-certificates openssh-client wget git curl python3 python3-pip python3-virtualenv && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/share/ca-certificates/cryptspirit.org
COPY certs/cryptspirit-ca.crt /usr/share/ca-certificates/cryptspirit.org/cryptspirit-ca.crt
RUN echo "cryptspirit.org/cryptspirit-ca.crt" >> /etc/ca-certificates.conf && update-ca-certificates
