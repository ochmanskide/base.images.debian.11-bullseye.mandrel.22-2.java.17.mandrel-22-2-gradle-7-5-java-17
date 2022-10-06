#!/usr/bin/env bash

set +x
set -e

echo
echo "CODEBUILD_BUILD_NUMBER: $CODEBUILD_BUILD_NUMBER"

IMAGE_TAG=$(git describe --tags)
LATEST_TAG=$(git describe --abbrev=0 --tags)

if [[ "$IMAGE_TAG" == "$LATEST_TAG" ]];
then
  export DOCKER_REPOSITORY='releases'
else
  export DOCKER_REPOSITORY='snapshots'
fi

groupId=$(gradle rootProjectGroupRaw -q | tr '.' '/')
artifactId=$(gradle rootProjectNameRaw -q)
version=$(gradle rootProjectVersionRaw -q)

echo
echo "[99%] Printing summary..."
echo
echo "Docker image was published into ${HOST}/${DOCKER_REPOSITORY}/${groupId}/${artifactId}:${version}"
