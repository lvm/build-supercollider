FROM ubuntu:latest

LABEL "com.github.actions.name"="build-deb"
LABEL "com.github.actions.description"="Builds Debian packages"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

ENV BASEDIR $(pwd)
ENV OUTPUT_FILE /tmp/SuperCollider-$VERSION-Source-linux.tar.bz2
ENV BUILD_DIR /tmp/SuperCollider-Source

ADD debian/ /debian
COPY build-deb.sh /usr/bin/build-deb.sh
COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
		build-essential devscripts debhelper wget emacs \
		ca-certificates libwww-perl gnupg2 file git \
		pristine-tar fakeroot pkg-config cmake subversion \
         	python-all-dev libboost-dev libboost-date-time-dev \
		libboost-filesystem-dev libboost-math-dev \
		libboost-program-options-dev libboost-regex-dev \
		libboost-system-dev libboost-test-dev libboost-thread-dev \
		libjack-jackd2-dev libudev-dev libsndfile1-dev libasound2-dev \
         	libavahi-client-dev libicu-dev libreadline6-dev libfftw3-dev \
         	libxt-dev libcwiid-dev libqt5webkit5-dev libqt5sensors5-dev \
         	qt5-default qt5-qmake qttools5-dev qttools5-dev-tools \
         	qtdeclarative5-dev qtpositioning5-dev libqt5opengl5-dev \
         	qtwebengine5-dev libqt5svg5-dev libqt5websockets5-dev

ENTRYPOINT ["/usr/bin/build-deb.sh"]
