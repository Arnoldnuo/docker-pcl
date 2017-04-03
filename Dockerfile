# Pull base image
# based on - https://larrylisky.com/2016/11/03/point-cloud-library-on-ubuntu-16-04-lts/
FROM ubuntu:14.04
MAINTAINER Matt MacGillivray


# install prereqs
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get update
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe"
RUN apt-get update
#RUN apt-get install -y build-essential linux-libc-dev
RUN apt-get install -y build-essential linux-libc-dev libxmu-dev libxi-dev
RUN apt-get install -y g++
RUN apt-get install -y cmake cmake-gui 
RUN apt-get install -y doxygen
RUN apt-get install -y mpi-default-dev openmpi-bin openmpi-common
RUN apt-get install -y libflann1.8 libflann-dev
RUN apt-get install -y libeigen3-dev
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libvtk5.8-qt4 libvtk5.8 libvtk5-dev
RUN apt-get install -y libqhull*
RUN apt-get install -y libusb-dev
RUN apt-get install -y libgtest-dev
RUN apt-get install -y git-core freeglut3-dev pkg-config
RUN apt-get install -y libusb-1.0.0-dev graphviz
RUN apt-get install -y qt-sdk openjdk-7-jdk openjdk-7-jre
RUN apt-get install -y phonon-backend-gstreamer
RUN apt-get install -y phonon-backend-vlc
RUN apt-get install -y openssh-client

RUN cd /opt && git clone https://github.com/PointCloudLibrary/pcl.git pcl-trunk
RUN ln -s /opt/pcl-trunk /opt/pcl
RUN cd /opt/pcl && git checkout pcl-1.8.0
RUN mkdir -p /opt/pcl-trunk/release
RUN cd /opt/pcl/release && cmake -DCMAKE_BUILD_TYPE=None -DBUILD_GPU=ON -DBUILD_apps=ON -DBUILD_examples=ON ..
RUN cd /opt/pcl/release && make -j3
RUN cd /opt/pcl/release && make install
