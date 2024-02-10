FROM ghcr.io/paperless-ngx/paperless-ngx:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN rm /etc/apt/sources.list.d/*
COPY apt/stable.list /etc/apt/sources.list.d/
COPY apt/testing.list /etc/apt/sources.list.d/

RUN apt update
RUN apt install -y tesseract-ocr

COPY scripts/fix-orientation.sh /usr/local/bin/
