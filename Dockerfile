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
RUN git clone -b dev https://github.com/arabic-digital-humanities/BlackLab.git \
    && git clone https://github.com/arabic-digital-humanities/index-safar.git \
    && cd BlackLab
WORKDIR /BlackLab
RUN mvn install
CMD /bin/bash
