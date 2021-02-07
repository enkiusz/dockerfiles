FROM python:3.9

MAINTAINER Maciej Grela enki@fsck.pl

RUN pip3 install structlog paho-mqtt asyncio-mqtt

RUN pip3 install git+https://github.com/mgrela/pyfronius@new-api
RUN curl --output /usr/local/bin/example-mqtt.py https://raw.githubusercontent.com/mgrela/pyfronius/new-api/examples/example-mqtt.py

ARG datamanager_url
ARG broker_url
ENV DATAMANAGER_URL=$datamanager_url
ENV BROKER_URL=$broker_url

ENTRYPOINT python3 /usr/local/bin/example-mqtt.py --datamanager-url $DATAMANAGER_URL --broker-url $BROKER_URL
