# Pull base image
FROM ubuntu:14.04
MAINTAINER Jaynti Kanani

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
RUN apt-get update
RUN apt-get install -y \
    wget \
    ca-certificates \
    apparmor \
    aufs-tools \
    automake \
    cmake \
    bash-completion \
    build-essential \
    curl \
    dpkg-sig \
    git \
    iptables \
    libapparmor-dev \
    libcap-dev \
    libsqlite3-dev \
    mercurial \
    parallel \
    python-mock \
    python-pip \
    python-websocket \
    --no-install-recommends
RUN apt-get install -y libpcl-all
