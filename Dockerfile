FROM openjdk:8
MAINTAINER maksim@nightbook.info

# base tools
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests  -y \
	ca-certificates \
	openssh-client \
	wget \
	make \
	git \
	rsync \
	imagemagick \
	curl
# python tools
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests  -y \
	python \
	python-pip \
	python3 \
	python3-pip \
	virtualenv \
	&& pip install setuptools --upgrade \
	&& pip3 install setuptools --upgrade
# ruby tools
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests  -y \
	ruby

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/share/ca-certificates/dcrft-ca
COPY certs/dcrft-ca.pem /usr/share/ca-certificates/cryptspirit.org/dcrft-ca
RUN echo "dcrft-ca/dcrft-ca.pem" >> /etc/ca-certificates.conf && update-ca-certificates
