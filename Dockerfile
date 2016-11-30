# Pull base image
FROM ubuntu:14.04
MAINTAINER Jaynti Kanani

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get install -y \
    gcc-4.9 \
    g++-4.9 \
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
    vim \
    --no-install-recommends
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9
RUN apt-get install -y libpcl-all
