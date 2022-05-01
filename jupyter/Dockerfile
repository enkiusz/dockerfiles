ARG ARCH=
FROM ${ARCH}/python:3.8

MAINTAINER Maciej Grela enki@fsck.pl

EXPOSE 8091

RUN pip3 install jupyter

RUN pip3 install pint materials skyfield influxdb-client tabulate

ENTRYPOINT jupyter notebook --port=8091 --ip=0.0.0.0 --no-browser --allow-root
