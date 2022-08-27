FROM alpine

MAINTAINER Maciej Grela enki@fsck.pl

RUN apk add py3-pip
RUN pip3 install structlog paho-mqtt pyserial python-pzem minimalmodbus

RUN wget -O /pzem016-publish-mqtt.py https://raw.githubusercontent.com/mgrela/tools/master/bin/pzem016-publish-mqtt.py

ARG pyserial_device
ARG broker_url
ENV PYSERIAL_DEVICE=$pyserial_device
ENV BROKER_URL=$broker_url

ENTRYPOINT python3 /pzem016-publish-mqtt.py --find-serialport $PYSERIAL_DEVICE --mqtt-broker $BROKER_URL
