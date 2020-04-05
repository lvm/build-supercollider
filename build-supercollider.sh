#!/bin/sh

###
#
# Variables
#
INSTALL_DIR=/tmp
SUPERCOLLIDER_VER=3.11
SUPERCOLLIDER_DIR=$INSTALL_DIR/supercollider
SUPERCOLLIDER_BUILD_DIR=$SUPERCOLLIDER_DIR/build

###
#
# Update
#
sudo apt update

###
#
# Install building dependencies
#
sudo apt install -yq \
         build-essential pkg-config cmake subversion git \
         libjack-jackd2-dev libudev-dev libsndfile1-dev libasound2-dev \
         libavahi-client-dev libicu-dev libreadline6-dev libfftw3-dev \
         libxt-dev libcwiid-dev libqt5webkit5-dev libqt5sensors5-dev \
         qt5-default qt5-qmake qttools5-dev qttools5-dev-tools \
         qtdeclarative5-dev qtpositioning5-dev libqt5opengl5-dev \
         qtwebengine5-dev libqt5svg5-dev libqt5websockets5-dev emacs

###
#
# Download and build SC
#
mkdir -p $SUPERCOLLIDER_DIR

# Download SC Source
git clone --recursive --branch $SUPERCOLLIDER_VER \
    https://github.com/supercollider/supercollider.git $SUPERCOLLIDER_DIR

# Create the the directory where SC will be built
mkdir -p $SUPERCOLLIDER_BUILD_DIR

# And build it.
cd $SUPERCOLLIDER_BUILD_DIR && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local \
          -DCMAKE_PREFIX_PATH=/usr/lib/x86_64-linux-gnu/ \
          -DBUILD_TESTING=OFF -DSC_ED=OFF -DSC_EL=OFF \
          -DSC_VIM=ON -DSC_IDE=ON .. && \
    make -j4 && \
    sudo make install && \
    sudo ldconfig
