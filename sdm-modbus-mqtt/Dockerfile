FROM alpine

MAINTAINER Maciej Grela enki@fsck.pl

RUN apk add py3-pip
RUN pip3 install structlog paho-mqtt sdm_modbus

RUN wget -O /sdm-modbus-mqtt.py https://raw.githubusercontent.com/mgrela/tools/master/bin/sdm-modbus-mqtt.py

ARG pyserial_device
ARG broker_url
ENV PYSERIAL_DEVICE=$pyserial_device
ENV BROKER_URL=$broker_url

ENTRYPOINT python3 /sdm-modbus-mqtt.py --find-serialport $PYSERIAL_DEVICE --mqtt-broker $BROKER_URL
