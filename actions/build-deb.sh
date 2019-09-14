#!/bin/bash

set -ex

wget https://github.com/supercollider/supercollider/releases/download/Version-$SC_VERSION/SuperCollider-$SC_VERSION-Source-linux.tar.bz2 -O $OUTPUT_FILE \
    && rm -fr $BUILD_DIR \
    && cd /tmp \
    && tar xjf $OUTPUT_FILE \
    && cd $BUILD_DIR \
    && cp /debian . -a \
    && uscan --force-download \
    && dpkg-buildpackage \
    && cd /tmp \
    && cp supercollider-community* $GITHUB_WORKSPACE \
    && cd $GITHUB_WORKSPACE \
    && git checkout -b gh-pages || git checkout gh-pages \
    && git remote add https https://${GITHUB_ACTOR}:${PERSONAL_TOKEN}@github.com/${GITHUB_REPOSITORY}.git \
    && git add supercollider-community* \
    && git config user.name "${GITHUB_ACTOR}" \
    && git config user.email "${GITHUB_ACTOR}@users.noreply.github.com" \
    && git commit -m "SC Version: ${SC_VERSION} (${GITHUB_SHA})" \
    && git push --force https gh-pages
