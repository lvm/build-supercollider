#!/bin/sh

## Variables
INSTALL_DIR=/tmp
SUPERCOLLIDER_DIR=$INSTALL_DIR/supercollider
SC3PLUGINS_DIR=$INSTALL_DIR/sc3-plugins

SC_SHARE_DIRECTORY=/usr/local/include/SuperCollider
SC_INCLUDE_DIRECTORY=/usr/local/share/SuperCollider
SC_LIB_DIRECTORY=/usr/local/lib/SuperCollider

## Uninstalling with make
sudo make -j4 -C $SC3PLUGINS_DIR/build uninstall 
sudo make -j4 -C $SUPERCOLLIDER_DIR/build uninstall 

## Remove wastes.
sudo rm -rf $SC_SHARE_DIRECTORY
sudo rm -rf $SC_INCLUDE_DIRECTORY
sudo rm -rf $SC_LIB_DIRECTORY

## Show result
echo "\nls /usr/local/include/" && ls /usr/local/include/
echo "ls /usr/local/share/" && ls /usr/local/share/
echo "ls /usr/local/lib/" && ls /usr/local/lib/


 
