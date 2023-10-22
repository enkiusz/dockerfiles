FROM alpine

MAINTAINER Maciej Grela enki@fsck.pl

RUN apk add py3-pip
RUN apk add libusb
RUN apk add git
RUN pip3 install structlog git+https://github.com/mgrela/paho.mqtt.python.git
RUN pip3 install git+https://github.com/mgrela/pyftdi.git

RUN wget -O /state-actuator.py https://raw.githubusercontent.com/mgrela/tools/master/bin/state-actuator.py

ARG pyftdi_url
ARG broker_url
ENV PYFTDI_URL=$pyftdi_url
ENV BROKER_URL=$broker_url

ENTRYPOINT python3 /state-actuator.py --url $PYFTDI_URL --mqtt-broker $BROKER_URL
