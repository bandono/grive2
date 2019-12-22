FROM debian:jessie
MAINTAINER Paul Woelfel <github@frig.at>

RUN apt-get update \
	&& apt-get -y upgrade \
	&& apt-get -y install git cmake build-essential libgcrypt11-dev libyajl-dev \
    libboost-all-dev libcurl4-openssl-dev libexpat1-dev libcppunit-dev binutils-dev \
	debhelper zlib1g-dev dpkg-dev pkg-config \
	&& rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/bandono/grive2-1.git \
	&& mkdir grive2-1/build \
	&& cd grive2-1/build  \
	&& cmake ..  \
	&& make -j4  \
	&& make install \
  && cd ../.. \
	&& rm -rf grive2-1 \
	&& mkdir /drive \
	&& echo "Grive installation finished!"

WORKDIR /drive
ENTRYPOINT ["/usr/local/bin/grive"]
CMD []
