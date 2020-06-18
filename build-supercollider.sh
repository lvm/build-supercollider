#!/bin/bash

set -eux -o pipefail

###
#
# Variables
#
echo -e "#\n# Variables\n#"
INSTALL_DIR=/tmp
SUPERCOLLIDER_VERSION=Version-3.11.0
SUPERCOLLIDER_DIR=$INSTALL_DIR/supercollider
SUPERCOLLIDER_BUILD_DIR=$SUPERCOLLIDER_DIR/build

###
#
# Update
#
echo -e "#\n# Update\n#"
sudo apt update

###
#
# Install building dependencies
#
echo -e "#\n# Install building dependencies\n#"
sudo apt install -yq \
         build-essential pkg-config cmake subversion git \
         libjack-jackd2-dev libudev-dev libsndfile1-dev libasound2-dev \
         libavahi-client-dev libicu-dev libreadline-dev libfftw3-dev \
         git libxt-dev libcwiid-dev libqt5webkit5-dev libqt5sensors5-dev \
         qt5-default qt5-qmake qttools5-dev qttools5-dev-tools \
         qtdeclarative5-dev qtpositioning5-dev libqt5opengl5-dev \
         qtwebengine5-dev libqt5svg5-dev libqt5websockets5-dev

###
#
# Prepare direcory
#
echo -e "#\n# Prepare direcory\n#"
rm -rf $SUPERCOLLIDER_DIR
mkdir -p $SUPERCOLLIDER_DIR

###
#
# Download SC Source
#
echo -e "#\n# Download SC Source\n#"
git clone --recurse-submodules --branch $SUPERCOLLIDER_VERSION \
    https://github.com/supercollider/supercollider.git $SUPERCOLLIDER_DIR

###
#
# Create the the directory where SC will be built
#
echo -e "#\n# Create the the directory where SC will be built\n#"
mkdir -p $SUPERCOLLIDER_BUILD_DIR

###
#
# And build it.
#
echo -e "#\n# And build it.\n#"
cd $SUPERCOLLIDER_BUILD_DIR && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local \
          -DCMAKE_PREFIX_PATH=/usr/lib/x86_64-linux-gnu/ \
          -DBUILD_TESTING=OFF \
          -DCMAKE_BUILD_TYPE=RelWithDebInfo \
          -DSC_EL=OFF \
          -DSC_ED=OFF \
          -DSC_VIM=OFF \
          -DSC_IDE=ON \
          -DNATIVE=ON .. && \
    make -j4 && \
    sudo make install && \
    sudo ldconfig
