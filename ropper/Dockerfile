ARG ARCH=
FROM ${ARCH}/python:3.8-slim-buster

MAINTAINER Maciej Grela <enki@fsck.pl>

RUN pip3 install ropper
RUN mkdir /ropper

ENTRYPOINT [ "/usr/local/bin/ropper" ]
WORKDIR /ropper

# Build:
# docker build -t ropper .

# Run (with target file in current directory)
# docker run -ti --rm -v $PWD:/ropper ropper:latest -f file.exe
