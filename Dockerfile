FROM python:3.9-bullseye

LABEL maintainer="Valentino Lauciani <valentino.lauciani@ingv.it>"

# Main variables
ENV INITRD No
ENV FAKE_CHROOT 1
ENV DEBIAN_FRONTEND=noninteractive

# Set bash as shell
SHELL ["/bin/bash", "-c"]

# Set bashrc
RUN echo "alias ll='ls -l'" >> ~/.bashrc

RUN apt-get clean \
    && apt-get update \
    && apt-get install -y \
    procps \
    iputils-ping \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN git clone https://code.usgs.gov/ghsc/esi/groundmotion-processing.git gmprocess

WORKDIR /opt/gmprocess
RUN pip install .

WORKDIR /opt

