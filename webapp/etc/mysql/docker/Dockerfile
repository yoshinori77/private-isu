# bitnami/mysqlのイメージにライブラリインストールするためのDockerfile
# 自分でbuildして使う
# 使い方
# $ docker build -t bitnami/mysql:ssl-certs  --no-cache .

# Use bitnami/mysql as the base image
# FROM bitnami/mysql
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

# Change user to perform privileged actions
USER 0

## SASE対応
ARG CA_ROOT="/usr/share/ca-certificates/netskope"
RUN mkdir -p ${CA_ROOT:-/usr/share/ca-certificates/netskope}
COPY certs/caCert.pem ${CA_ROOT:-/usr/share/ca-certificates/netskope}/cert-bundle.crt
COPY certs/rootcaCert.pem ${CA_ROOT:-/usr/share/ca-certificates/netskope}/root-cert-bundle.crt

## 環境変数を設定
ENV AWS_CA_BUNDLE=${CA_ROOT:-/usr/share/ca-certificates/netskope}/cert-bundle.crt
ENV SSL_CERT_FILE=${CA_ROOT:-/usr/share/ca-certificates/netskope}/cert-bundle.crt
ENV CURL_CA_BUNDLE=${CA_ROOT:-/usr/share/ca-certificates/netskope}/cert-bundle.crt

## OS用の設定反映
RUN echo "netskope/cert-bundle.crt" >> /etc/ca-certificates.conf && \
    echo "netskope/root-cert-bundle.crt" >> /etc/ca-certificates.conf && \
    update-ca-certificates

# Install modules
RUN apt update  && \
    apt install less -y && \
    apt install dstat -y

# 非rootユーザー（UID 1001）のエントリを/etc/passwdに追加
RUN echo "myuser:x:1001:1001:Custom User,,,:/home/myuser:/bin/bash" >> /etc/passwd && \
    chown -R 1001:1001 /docker-entrypoint-initdb.d/ && \
    chown -R 1001:1001 /bitnami/mysql/data/ && \
    chown -R 1001:1001 /opt/bitnami/mysql/tmp/

# Modify the default container user
USER 1001
