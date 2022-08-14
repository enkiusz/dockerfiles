FROM alpine

MAINTAINER Maciej Grela enki@fsck.pl

RUN apk add py3-pip
RUN pip3 install structlog paho-mqtt pyserial
RUN pip3 install pint

RUN wget -O /sobasic-meter.py https://raw.githubusercontent.com/mgrela/tools/master/bin/sobasic-meter.py

ARG pyserial_device
ARG broker_url
ARG mqtt_topic
ARG quantum
ENV PYSERIAL_DEVICE=$pyserial_device
ENV BROKER_URL=$broker_url
ENV MQTT_TOPIC=$mqtt_topic
ENV QUANTUM=$quantum

ENTRYPOINT python3 /sobasic-meter.py --find-serialport $PYSERIAL_DEVICE --mqtt-broker $BROKER_URL --mqtt-topic $MQTT_TOPIC --quantum $QUANTUM
