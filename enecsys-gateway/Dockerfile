FROM alpine

MAINTAINER Maciej Grela enki@fsck.pl

RUN apk add py3-pip
RUN pip3 install structlog paho-mqtt 
RUN pip3 install hexdump
RUN pip3 install requests

RUN wget -O /enecsys-watch-zigbee.py https://raw.githubusercontent.com/mgrela/magical-index/master/hardware/enecsys-gateway-cg-a-ab-us-1/enecsys-watch-zigbee.py

ARG gateway_url
ARG broker_url
ENV GATEWAY_URL=$gateway_url
ENV BROKER_URL=$broker_url

ENTRYPOINT python3 /enecsys-watch-zigbee.py --gateway-url $GATEWAY_URL --broker-url $BROKER_URL
