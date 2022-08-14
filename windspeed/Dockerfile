FROM alpine

MAINTAINER Maciej Grela enki@fsck.pl

RUN apk add py3-pip
RUN pip3 install structlog paho-mqtt pyserial

RUN wget -O /windspeed-sensor.py https://raw.githubusercontent.com/mgrela/tools/master/bin/windspeed-sensor.py

ARG pyserial_device
ARG broker_url
ARG f
ENV PYSERIAL_DEVICE=$pyserial_device
ENV BROKER_URL=$broker_url
ENV F=$f

ENTRYPOINT python3 /windspeed-sensor.py -f $F --find-serialport $PYSERIAL_DEVICE --mqtt-broker $BROKER_URL
