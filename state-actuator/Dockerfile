FROM alpine

MAINTAINER Maciej Grela enki@fsck.pl

RUN apk add py3-pip
RUN apk add libusb
RUN pip3 install structlog paho-mqtt pyftdi

RUN wget -O /state-actuator.py https://raw.githubusercontent.com/mgrela/tools/master/bin/state-actuator.py

ARG pyserial_device
ARG broker_url
ENV PYSERIAL_DEVICE=$pyserial_device
ENV BROKER_URL=$broker_url

ENTRYPOINT python3 /state-actuator.py --mqtt-broker $BROKER_URL
