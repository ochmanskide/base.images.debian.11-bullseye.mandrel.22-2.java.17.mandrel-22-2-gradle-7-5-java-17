#!/usr/bin/env zsh

#login
cd $GITHUB/base/images/debian/11-bullseye/mandrel/22-2/java/17/mandrel-22-2-gradle-7-5-java-17 || exit
DOCKER_HUB_HOST=ochmanskide
#GROUP_ID=$(gradle rootProjectGroupRaw -q)
#ARTIFACT_ID=$(gradle rootProjectNameRaw -q)
#IMAGE_TAG=$(gradle rootProjectVersionRaw -q)

GROUP_ID='base.images.debian.11-bullseye.mandrel.22-2.java.17'
ARTIFACT_ID='mandrel-22-2-gradle-7-4-java-17'
IMAGE_TAG=$(gradle printVersion -q)

docker build -t "$DOCKER_HUB_HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG-slim . # --squash
docker run --rm -ti --privileged --entrypoint /bin/bash "$HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG-slim
docker image rm "$DOCKER_HUB_HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG-slim
echo

if [[ "$IMAGE_TAG" == *-SNAPSHOT ]]
then
  export DOCKER_REPOSITORY='snapshots/'
else
  export DOCKER_REPOSITORY=''
fi

echo "docker build -t $DOCKER_HUB_HOST/$DOCKER_REPOSITORY$GROUP_ID/$ARTIFACT_ID:$IMAGE_TAG ."
echo "docker push $DOCKER_HUB_HOST/$DOCKER_REPOSITORY$GROUP_ID/$ARTIFACT_ID:$IMAGE_TAG"
