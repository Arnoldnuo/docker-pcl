# Pull base image
# based on - https://larrylisky.com/2016/11/03/point-cloud-library-on-ubuntu-16-04-lts/
FROM ubuntu:14.04
MAINTAINER Matt MacGillivray


# install prereqs
# update apt repository - https://smyl.es/how-to-fix-ubuntudebian-apt-get-404-not-found-package-repository-errors-saucy-raring-quantal-oneiric-natty/
RUN apt-get update && apt-get install -y \
	software-properties-common \
RUN apt-get update \
	&& add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" \
	&& sudo sed -i -e 's/archive.ubuntu.com\|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list \
#	&& cat /etc/apt/sources.list \
	&& apt-get clean && apt-get update

#RUN apt-get install -y build-essential linux-libc-dev
RUN apt-get update && apt-get install -y \
		build-essential linux-libc-dev libxmu-dev libxi-dev \
		g++ \
		cmake cmake-gui \
		doxygen \
		mpi-default-dev openmpi-bin openmpi-common \
		libflann1.8 libflann-dev \
		libeigen3-dev \
		libboost-all-dev \
		libvtk5.8-qt4 libvtk5.8 libvtk5-dev \
		libqhull* \
		libusb-dev \
		libgtest-dev \
		git-core freeglut3-dev pkg-config \
		libusb-1.0.0-dev graphviz \
		qt-sdk openjdk-7-jdk openjdk-7-jre \
		phonon-backend-gstreamer \
		phonon-backend-vlc \
		openssh-client \
		vim \
		nano

# PCL - build from source and install
RUN cd /opt \ 
	git clone https://github.com/PointCloudLibrary/pcl.git pcl-trunk \
	ln -s /opt/pcl-trunk /opt/pcl \
	cd /opt/pcl && git checkout pcl-1.8.0 \
	mkdir -p /opt/pcl-trunk/release \
	cd /opt/pcl/release && cmake -DCMAKE_BUILD_TYPE=None -DBUILD_GPU=ON -DBUILD_apps=ON -DBUILD_examples=ON .. \
	cd /opt/pcl/release && make -j3 \
	cd /opt/pcl/release && make install
