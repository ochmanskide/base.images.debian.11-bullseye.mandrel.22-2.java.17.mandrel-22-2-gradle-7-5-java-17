#!/usr/bin/env bash

set +x
set -e

groupadd docker
usermod -aG docker root

# set up subuid/subgid so that "--userns-remap=default" works out-of-the-box
addgroup dockremap
useradd -g dockremap dockremap
echo 'dockremap:165536:65536' >> /etc/subuid
echo 'dockremap:165536:65536' >> /etc/subgid
chmod +x /usr/local/bin/dind
docker -v
