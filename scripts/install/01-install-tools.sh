#!/usr/bin/env bash

set +x
set -e

apt-get clean \
    && apt-get update -y \
    && apt-get install locales -y \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && locale-gen --purge en_US.UTF-8 \
    && echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale \
    && apt-get install -y locales \
    && sed -i -e "s/# $LANG.*/$LANG UTF-8/" /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=$LANG

echo "#################################################"
echo "Installing tools..."
echo "#################################################"
apt-get install --no-install-recommends -y bc ca-certificates curl git htop jq less mc procps vim xz-utils zip unzip
echo -e "set ignorecase
set showmatch
set novisualbell
set noerrorbells
syntax enable
set mouse-=a" > ~/.vimrc
