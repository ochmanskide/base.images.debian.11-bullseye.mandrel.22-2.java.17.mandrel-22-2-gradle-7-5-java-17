#!/usr/bin/env bash

set +x
set -e

DOCKER_BUCKET="download.docker.com"
DOCKER_CHANNEL="stable"
DIND_COMMIT="3b5fac462d21ca164b3778647420016315289034"
DOCKER_SHA256="dd6ff72df1edfd61ae55feaa4aadb88634161f0aa06dbaaf291d1be594099ff3"
DOCKER_VERSION="20.10.11"

apt-get update
apt-get install -y -qq --no-install-recommends iptables llvm
curl -fSL "https://${DOCKER_BUCKET}/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz
echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c -
tar --extract --file docker.tgz --strip-components 1  --directory /usr/local/bin/
rm docker.tgz

curl -fSL "https://raw.githubusercontent.com/docker/docker/${DIND_COMMIT}/hack/dind" -o /usr/local/bin/dind
