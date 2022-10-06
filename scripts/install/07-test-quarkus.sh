#!/usr/bin/env bash

set +x
set -e

alias la='ls -la'
apt-get update -y
apt-get install curl unzip -y
cd /home/quarkus
rm -f /home/quarkus/code-with-quarkus.zip
rm -rf /home/quarkus/code-with-quarkus
curl -O -J https://code.quarkus.io/d?e=io.quarkus:quarkus-resteasy -o /home/quarkus/code-with-quarkus.zip
unzip /home/quarkus/code-with-quarkus.zip -d /home/quarkus/
rm -f /home/quarkus/code-with-quarkus.zip
cd /home/quarkus/code-with-quarkus/
/home/quarkus/code-with-quarkus/mvnw package -Pnative -f /home/quarkus/code-with-quarkus/pom.xml
/home/quarkus/code-with-quarkus/target/code-with-quarkus-1.0.0-SNAPSHOT-runner
