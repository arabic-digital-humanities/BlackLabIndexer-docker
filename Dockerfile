FROM ubuntu:16.04

LABEL maintainer "d.vankuppevelt@esciencecenter.nl"

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    build-essential \
    git \
    default-jre \
    default-jdk \
    maven \
    && apt-get autoremove \
		&& apt-get clean
WORKDIR /
RUN git clone -b v2.0.0-RC1 --depth 1 https://github.com/INL/BlackLab.git \
    && cd BlackLab
WORKDIR /BlackLab
RUN mvn install
CMD /bin/bash
