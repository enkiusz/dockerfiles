FROM alpine
ARG CACHEBUST=0
MAINTAINER Maciej Grela enki@fsck.pl

RUN apk add python3 git
RUN python3 -m venv .venv
RUN .venv/bin/pip install structlog paho-mqtt pymodbus[serial]
RUN .venv/bin/pip install git+https://github.com/enkiusz/sdm_modbus.git@remove-rtu-method

RUN wget -O /sdm-modbus-mqtt.py https://raw.githubusercontent.com/mgrela/tools/master/bin/sdm-modbus-mqtt.py

ARG pyserial_device
ARG broker_url
ENV PYSERIAL_DEVICE=$pyserial_device
ENV BROKER_URL=$broker_url

ENTRYPOINT /.venv/bin/python3 /sdm-modbus-mqtt.py --find-serialport $PYSERIAL_DEVICE --mqtt-broker $BROKER_URL
