FROM alpine

MAINTAINER Maciej Grela enki@fsck.pl

RUN apk add py3-pip
RUN pip3 install pyserial
RUN pip3 install structlog paho-mqtt

RUN wget -O /fatek-flight-recorder.py https://raw.githubusercontent.com/mgrela/tools/master/bin/fatek-flight-recorder.py

ARG pyserial_device
ARG broker_url
ARG settable_inputs
ENV PYSERIAL_DEVICE=$pyserial_device
ENV BROKER_URL=$broker_url
ENV SETTABLE_INPUTS=$settable_inputs

ENTRYPOINT python3 /fatek-flight-recorder.py -p $PYSERIAL_DEVICE --mqtt-broker $BROKER_URL $SETTABLE_INPUTS
