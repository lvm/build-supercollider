#!/bin/bash

DEPENDENCY_LIST="build-essential pkg-config cmake subversion git libjack-jackd2-dev libudev-dev libsndfile1-dev libasound2-dev libavahi-client-dev libicu-dev libreadline-dev libfftw3-dev libxt-dev libcwiid-dev libqt5webkit5-dev libqt5sensors5-dev qt5-default qt5-qmake qttools5-dev qttools5-dev-tools qtdeclarative5-dev qtpositioning5-dev"

CODENAME=$(lsb_release -cs)

echo -e "#\n# Check if dependency is belonging to $CODENAME\n#"

for dep in $DEPENDENCY_LIST; do
  echo "Dependency: $dep" && apt search $dep 2>/dev/null | grep ^$dep/$CODENAME
  echo -e ""
done
