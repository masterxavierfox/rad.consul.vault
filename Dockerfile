FROM ubuntu:16.04
MAINTAINER Pierre Carion <pcarion@gmail.com>
ENV VAULT_VERSION 0.8.3
ENV CONSUL_VERSION 0.9.3

RUN apt-get update \
  && apt-get install -y \
  build-essential \
  git \
  curl \
  wget \
  vim \
  net-tools \
  iputils-ping \
  dnsutils \
  zip \
  unzip \
  && wget -O /tmp/vault.zip "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip" \
  && unzip -d /bin /tmp/vault.zip \
  && chmod 755 /bin/vault \
  && rm /tmp/vault.zip \
  && wget -O /tmp/consul.zip "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip" \
  && unzip -d /bin /tmp/consul.zip \
  && chmod 755 /bin/consul \
  && rm /tmp/consul.zip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

VOLUME "/mnt/data"
CMD ["/bin/bash"]