#!/usr/bin/env bash

set +x
set -e

curl https://downloads.gradle.org/distributions/gradle-7.5-bin.zip > gradle.zip
unzip -d /opt gradle.zip
mv /opt/gradle-7.5 /opt/gradle
ln -s /opt/gradle/bin/gradle /usr/bin/gradle
rm gradle.zip

ln -s /home/gradle/.gradle /root/.gradle
