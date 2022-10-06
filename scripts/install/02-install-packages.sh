#!/usr/bin/env bash

set +x
set -e

echo "#################################################"
echo "Installing packages required by GraalVM..."
echo "Details: https://github.com/graalvm/mandrel/releases"
echo "#################################################"
apt-get install --no-install-recommends -y build-essential libz-dev zlib1g-dev


set -eu -o pipefail

echo "#################################################"
echo "Installing latest UPX..."
echo "#################################################"
mkdir /opt/upx
upx_download_url=$(curl -fsSL https://api.github.com/repos/upx/upx/releases/latest | grep browser_download_url | grep amd64_linux.tar.xz | cut "-d\"" -f4)
echo "Downloading [$upx_download_url]..."
curl -fL $upx_download_url | tar Jxv -C /opt/upx --strip-components=1
