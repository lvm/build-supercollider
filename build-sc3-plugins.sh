#!/bin/bash

set -eux -o pipefail

###
#
# Variables
#
echo -e "#\n# Variables\n#"
INSTALL_DIR=/tmp
SUPERCOLLIDER_DIR=$INSTALL_DIR/supercollider
SUPERCOLLIDER_VER=3.10

SC3_PLUGINS_DIR=$INSTALL_DIR/sc3-plugins
SC3_PLUGINS_BUILD_DIR=$SC3_PLUGINS_DIR/build
SC3_DIRECTORY=/usr/local/share/SuperCollider
SC3_EXT_DIRECTORY=/usr/local/share/SuperCollider/Extensions

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
         libxt-dev libcwiid-dev libqt5webkit5-dev libqt5sensors5-dev \
         qt5-default qt5-qmake qttools5-dev qttools5-dev-tools \
         qtdeclarative5-dev qtpositioning5-dev

###
#
# Download and build SC
#
echo -e "#\n# Download and build SC\n#"
rm -rf $SC3_PLUGINS_DIR
mkdir -p $SC3_PLUGINS_DIR

###
#
# Download SC3 Plugins Source
#
echo -e "#\n# Download SC3 Plugins Source\n#"
git clone --recursive --branch $SUPERCOLLIDER_VER \
    https://github.com/supercollider/sc3-plugins.git $SC3_PLUGINS_DIR

###
#
# Create the the directory where SC3 Plugins will be built
#
echo -e "#\n# Create the the directory where SC3 Plugins will be built\n#"
mkdir -p $SC3_PLUGINS_BUILD_DIR

sudo mkdir -p $SC3_EXT_DIRECTORY

###
#
# And build it.
#
echo -e "#\n# And build it.\n#"
cd $SC3_PLUGINS_BUILD_DIR && \
    cmake -DCMAKE_PREFIX_PATH=/usr/lib/x86_64-linux-gnu/ \
          -DCMAKE_INSTALL_PREFIX=/usr/local \
          -DCMAKE_BUILD_TYPE=RelWithDebInfo \
          -DSC_PATH=$SUPERCOLLIDER_DIR \
          -DSUPERNOVA=ON \
          -DBUILD_TESTING=OFF \
          -DQUARKS=ON \
          -DNATIVE=ON .. && \
    make -j4 && \
    sudo make install && \
    sudo ldconfig && \
    sudo mv $SC3_DIRECTORY/SC3plugins $SC3_EXT_DIRECTORY/SC3plugins
    # This plugin ceases scsynth launching. In new version there will be flag to deactivate ladspa.
    sudo rm /usr/local/lib/SuperCollider/plugins/LadspaUGen.so
    sudo rm /usr/local/lib/SuperCollider/plugins/LadspaUGen_supernova.so
