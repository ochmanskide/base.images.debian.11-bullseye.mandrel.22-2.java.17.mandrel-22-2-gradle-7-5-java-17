#!/usr/bin/env bash

set +x
set -e

apt-get remove --no-install-recommends -y bc curl htop jq less mc procps vim xz-utils zip unzip llvm
rm -rf /opt/upx
apt-get autoclean
apt-get autoremove -y
rm -rf /var/cache/apt/*
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
apt-get clean
