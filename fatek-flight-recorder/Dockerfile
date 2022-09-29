FROM alpine

MAINTAINER Maciej Grela enki@fsck.pl

RUN apk add py3-pip
RUN apk add libusb
RUN pip3 install structlog paho-mqtt

RUN wget -O /fatek-flight-recorder.py https://raw.githubusercontent.com/mgrela/tools/master/bin/fatek-flight-recorder.py

ARG pyserial_device
ARG broker_url
ENV PYSERIAL_DEVICE=$pyserial_device
ENV BROKER_URL=$broker_url

ENTRYPOINT python3 /fatek-flight-recorder.py -p $PYSERIAL_DEVICE --mqtt-broker $BROKER_URL
