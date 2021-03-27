#!/bin/sh

###
#
# Variables
#
INSTALL_DIR=/tmp
SUPERCOLLIDER_VER='Version-3.11.0'
SC3PLUGINS_DIR=$INSTALL_DIR/sc3-plugins
SC3PLUGINS_BUILD_DIR=$SC3PLUGINS_DIR/build
SC3_DIRECTORY=/usr/local/share/SuperCollider
SC3_EXT_DIRECTORY=/usr/local/share/SuperCollider/Extensions

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
         qt5-qmake qttools5-dev qttools5-dev-tools \
         qtdeclarative5-dev qtpositioning5-dev
sudo apt install -yq qt5-default

###
#
# Download and build SC
#
mkdir -p $SC3PLUGINS_DIR

# Download SC3 Plugins Source
git clone --recursive --branch $SUPERCOLLIDER_VER \
    https://github.com/supercollider/sc3-plugins.git $SC3PLUGINS_DIR

# Create the the directory where SC3 Plugins will be built
mkdir -p $SC3PLUGINS_BUILD_DIR

sudo mkdir -p $SC3_EXT_DIRECTORY

# And build it.
cd $SC3PLUGINS_BUILD_DIR && \
    cmake -DCMAKE_PREFIX_PATH=/usr/lib/x86_64-linux-gnu/ \
          -DCMAKE_INSTALL_PREFIX=/usr/local \
          -DSC_PATH=/tmp/supercollider/ \
          -DBUILD_TESTING=OFF -DQUARKS=ON -DSUPERNOVA=ON .. && \
    make -j4 && \
    sudo make install && \
    sudo ldconfig && \
    sudo mv $SC3_DIRECTORY/SC3plugins $SC3_EXT_DIRECTORY/SC3plugins
