#!/usr/bin/env bash

set +x
set -e

prefix="refs/tags/"
string_with_prefix=$(git describe --tags)
IMAGE_TAG=${string_with_prefix#"$prefix"}
export IMAGE_TAG=${string_with_prefix#"$prefix"}
sed -i "s/local-SNAPSHOT/$IMAGE_TAG/g" build.gradle
