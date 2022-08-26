FROM alpine

MAINTAINER Maciej Grela enki@fsck.pl

RUN apk add py3-pip
RUN pip3 install structlog paho-mqtt pyserial

RUN wget -O /senml-publish.py https://raw.githubusercontent.com/mgrela/tools/master/bin/senml-publish.py

ARG pyserial_device
ARG broker_url
ARG topic
ENV PYSERIAL_DEVICE=$pyserial_device
ENV BROKER_URL=$broker_url
ENV TOPIC=$topic

ENTRYPOINT python3 /senml-publish.py --find-serialport $PYSERIAL_DEVICE --mqtt-broker $BROKER_URL --mqtt-topic $TOPIC
