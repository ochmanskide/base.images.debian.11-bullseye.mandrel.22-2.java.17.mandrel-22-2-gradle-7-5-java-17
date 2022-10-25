# Debian-based Mandrel image optimized for building Quarkus projects

last updated: last updated: ###TIMESTAMP###   
author: Lukasz Ochmanski (github@ochmanski.de)  
  
[![Github tag](https://badgen.net/github/tag/ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17?icon=github&kill_cache=1)](https://github.com/ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17/tags/###CI_COMMIT_TAG###)  
&nbsp;
  
**Project details:**  
![GitHub](https://img.shields.io/github/license/ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17)
![java17](https://img.shields.io/badge/Java-17-brightgreen) 
![gradle](https://img.shields.io/badge/Gradle-7.5-brightgreen) 
![graalvm](https://img.shields.io/badge/GraalVM-22.2.0-brightgreen) 
![mandrel](https://img.shields.io/badge/Mandrel-22.2.0-brightgreen) 
![distribution](https://img.shields.io/badge/Distribution-Debian-brightgreen) 
![arch](https://img.shields.io/badge/Arch-amd64-brightgreen)  
&nbsp;  
  
&nbsp;
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [1. How to clone:](#1-how-to-clone)
- [2. GitHub repository URL](#2-github-repository-url)
- [3. How to build locally:](#3-how-to-build-locally)
- [4. DockerHub page:](#4-dockerhub-page)
- [5. Image coordinates:](#5-image-coordinates)
- [6. Available Docker images and tags:](#6-available-docker-images-and-tags)
- [7. What's in this image:](#7-whats-in-this-image)
- [8. FROM image:](#8-from-image)
- [9. Docker Hub page:](#9-docker-hub-page)
- [10. Excerpt from official Mandrel documentation](#10-excerpt-from-official-mandrel-documentation)
- [11. Docker image details:](#11-docker-image-details)
- [12. Usage](#12-usage)
  - [12.1. Run Quarkus with Gradle](#121-run-quarkus-with-gradle)
  - [12.2. Run Quarkus with Maven](#122-run-quarkus-with-maven)
- [13. License](#13-license)
- [14. Acknowledgments](#14-acknowledgments)
- [15. Frequently Asked Questions (FAQ)](#15-frequently-asked-questions-faq)
  - [15.1. Is this project OpenSource?](#151-is-this-project-opensource)
  - [15.2. How can I contact the maintainer?](#152-how-can-i-contact-the-maintainer)
  - [15.2. Is this image compatible with AWS CodeBuild pipeline?](#152-is-this-image-compatible-with-aws-codebuild-pipeline)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
  
&nbsp;

## About
Mandrel focuses on GraalVM's native-image component in order to provide an easy way for Quarkus users to generate native images for their applications.  
Developers using Quarkus should be able to go all the way from Java source code to lean, native, platform-dependent applications running on Linux.  
This capability is vital for deploying to containers in a cloud-native application development model. 

## Before you start

### Gradle configuration

Before you start it is assumed that you installed SDKMAN, Java and Gradle.
```bash
sdk install java 17.0.4.1-tem
sdk install gradle 7.5
```
&nbsp;
&nbsp;

## 1. How to clone:
```bash
git clone git@github.com:ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17.git \
~/Workspace/ochmanskide/base/images/debian/11-bullseye/mandrel/22-2/java/17/mandrel-22-2-gradle-7-5-java-17
```
&nbsp;

## 2. GitHub repository URL
https://github.com/ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17
&nbsp;

&nbsp;
## 3. How to build locally:
```bash
export DOCKER_HUB_HOST=$USER
cd ~/Workspace/ochmanskide/base/images/debian/11-bullseye/mandrel/22-2/java/17/mandrel-22-2-gradle-7-5-java-17
gradle docker
```
to push:
```bash
gradle dockerPush
```
to see all tasks:
```bash
gradle tasks
```
More about Gradle Docker Plugin: https://github.com/palantir/gradle-docker  
&nbsp;

&nbsp;

## 4. DockerHub page:
https://hub.docker.com/repository/docker/ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17
&nbsp;

&nbsp;

## 5. Image coordinates:
```  
docker pull ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17:1.0.10
```

## 6. Available Docker images and tags:
```
REPOSITORY                                                                                        TAG                    SIZE
ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17   ###CI_COMMIT_TAG###                  1.18GB
ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17   latest                 1.18GB
debian                                                                                            stable-20220711-slim   80.4MB
```

## 7. What's in this image?
```
### Mandrel Image
### Debian Slim
### Debian based Mandrel Official Image
### base/images/debian/debian-11-bullseye/mandrel/22-2/java-17/mandrel-22-2-gradle-7-5-java-17
### base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17
### ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17

debian-11-bullseye/mandrel-22-2-gradle-7-5-java-17   00-slim            80MB   (80MB)
debian-11-bullseye/mandrel-22-2-gradle-7-5-java-17   01-clean           80MB   (0MB)
debian-11-bullseye/mandrel-22-2-gradle-7-5-java-17   02-graalvm         465MB  (385MB)
debian-11-bullseye/mandrel-22-2-gradle-7-5-java-17   03-gradle          594MB  (129MB)
debian-11-bullseye/mandrel-22-2-gradle-7-5-java-17   04-aws-cli         753MB  (159MB)
debian-11-bullseye/mandrel-22-2-gradle-7-5-java-17   05-docker-cli      805MB  (52MB)
debian-11-bullseye/mandrel-22-2-gradle-7-5-java-17   06-dockerd         870MB  (65MB)
debian-11-bullseye/mandrel-22-2-gradle-7-5-java-17   07-containerd      904MB  (34MB)
debian-11-bullseye/mandrel-22-2-gradle-7-5-java-17   08-build-essential
debian-11-bullseye/mandrel-22-2-gradle-7-5-java-17   09-libz-dev
debian-11-bullseye/mandrel-22-2-gradle-7-5-java-17   10-zlib1g-dev      1.11GB (196MB)
debian-11-bullseye/mandrel-22-2-gradle-7-5-java-17   11-git             1.18GB (70MB)
```

## 8. FROM image:
https://hub.docker.com/_/debian

```  
FROM debian:stable-20220711-slim
```

## 9. Docker Hub page:
https://hub.docker.com/repository/docker/ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17
&nbsp;

&nbsp;

## 10. Excerpt from official Mandrel documentation

**Mandrel 22.2.0.0-Final** is a downstream distribution of the **GraalVM** community edition 22.2.0.  
Mandrel's main goal is to provide a native-image release specifically to support Quarkus.  
The aim is to align the native-image capabilities from GraalVM with OpenJDK and Red Hat Enterprise Linux libraries to improve maintainability for native Quarkus applications.  

**How Does Mandrel Differ From Graal**  
Mandrel releases are built from a code base derived from the upstream GraalVM code base, with only minor changes but some significant exclusions.  
They support the same native image capability as GraalVM with no significant changes to functionality.  
They do not include support for Polyglot programming via the Truffle interpreter and compiler framework.  
In consequence, it is not possible to extend Mandrel by downloading languages from the Truffle language catalogue.  

Mandrel is also built slightly differently to GraalVM, using the standard OpenJDK project release of jdk11u.  
This means it does not profit from a few small enhancements that Oracle have added to the version of OpenJDK used to build their own GraalVM downloads.  
Most of these enhancements are to the JVMCI module that allows the Graal compiler to be run inside OpenJDK.  
The others are small cosmetic changes to behaviour.  
These enhancements may in some cases cause minor differences in the progress of native image generation.  
They should not cause the resulting images themselves to execute in a noticeably different manner.  

Mandrel's `native-image` depends on the following packages:  

```
freetype-devel
gcc
glibc-devel
libstdc++-static
zlib-devel
```
On Fedora/CentOS/RHEL they can be installed with:  

```bash
dnf install glibc-devel zlib-devel gcc freetype-devel libstdc++-static
```
> Note: The package might be called `glibc-static` or `libstdc++-devel` instead of `libstdc++-static` depending on your system.  
> If the system is missing `stdc++`, `gcc-c++` package is needed too.

On Ubuntu-like systems with:  
```bash
apt install g++ zlib1g-dev libfreetype6-dev
```

## 11. Docker image details:
```bash
$ docker run -it --entrypoint /bin/bash ochmanskide/mandrel-gradle:latest

# echo $0
/bin/bash

# pwd
/home/gradle

# whoami
root

# cat /etc/*-release
PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
NAME="Debian GNU/Linux"
VERSION_ID="11"
VERSION="11 (bullseye)"
VERSION_CODENAME=bullseye
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

# printenv
GRAALVM_HOME=/opt/graalvm
DOCKER_HUB_URL=https://hub.docker.com/repository/docker/
DOCKER_HOST=ochmanskide
JAVA_HOME=/opt/graalvm
GRADLE_HOME=/opt/gradle
DOCKER_REPOSITORY=releases
PWD=/home/gradle
IMAGE_SOURCE=https://github.com/ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17
HOME=/root
GRADLE_VERSION=7.5
TERM=xterm
HOST=ochmanskide
SHLVL=1
PATH=/opt/graalvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
DOWNLOADS=/downloads
DEBIAN_FRONTEND=noninteractive
JAVA_VERSION=17.0.3+7
_=/usr/bin/printenv

# curl --version
bash: curl: command not found

# java -version
openjdk version "17.0.3" 2022-04-19
OpenJDK Runtime Environment Temurin-17.0.3+7 (build 17.0.3+7)
OpenJDK 64-Bit Server VM Temurin-17.0.3+7 (build 17.0.3+7, mixed mode, sharing)
root@40d34d5c68df:/home/gradle#

# git version
git version 2.30.2

# docker --version
Docker version 20.10.11, build dea9396

# gradle -version

Welcome to Gradle 7.5!

Here are the highlights of this release:
 - Support for Java 18
 - Support for building with Groovy 4
 - Much more responsive continuous builds
 - Improved diagnostics for dependency resolution

For more details see https://docs.gradle.org/7.5/release-notes.html


------------------------------------------------------------
Gradle 7.5
------------------------------------------------------------

Build time:   2022-07-14 12:48:15 UTC
Revision:     c7db7b958189ad2b0c1472b6fe663e6d654a5103

Kotlin:       1.6.21
Groovy:       3.0.10
Ant:          Apache Ant(TM) version 1.10.11 compiled on July 10 2021
JVM:          17.0.3 (Eclipse Adoptium 17.0.3+7)
OS:           Linux 5.10.25-linuxkit amd64


# aws --version
aws-cli/2.7.18 Python/3.9.11 Linux/5.10.104-linuxkit exe/x86_64.debian.11 prompt/off

# cat /home/gradle/.gradle/gradle.properties
org.gradle.daemon=true
org.gradle.parallel=true
org.gradle.caching=true
org.gradle.console=plain

# ls -la /home/gradle
drwxr-xr-x 1 root root 4096 Apr 19 10:21 .
drwxr-xr-x 1 root root 4096 Apr 13 14:57 ..
-rwxr-xr-x 1 root root  220 Apr 14 08:44 .bash_logout
-rwxr-xr-x 1 root root 3771 Apr 14 08:44 .bashrc
drwxr-xr-x 1 root root 4096 Apr 19 10:21 .gradle
-rwxr-xr-x 1 root root  807 Apr 14 08:44 .profile
```

## 12. Usage
```bash
docker run -it --entrypoint /bin/bash ochmanskide/mandrel-gradle
java -version && echo
gradle -version && echo
docker --version && echo
aws --version && echo
alias la='ls -la' && echo
la /usr/local/bin/containerd && echo
/usr/local/bin/dockerd-entrypoint.sh 2> /dev/null && echo
/home/aws/ecr/login.sh && echo
docker images && echo
```

### 12.1. Run Quarkus with Gradle
clone the project:
```bash
docker run -it --entrypoint /bin/bash ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17
git clone https://github.com/ochmanskide/quarkus.code-with-quarkus.git /home/quarkus/code-with-quarkus
cd /home/quarkus/code-with-quarkus
```
build native image:
```bash
gradle build -x test -Dquarkus.package.type=native
```
when the build completes, you may run the image, which is located somewhere in /build/libs/ directory.
```bash
/home/quarkus/quarkus-jpa-example/build/libs/code-with-quarkus-1.0.0-SNAPSHOT-runner
```

### 12.2. Run Quarkus with Maven
```bash
docker run -it --entrypoint /bin/bash ochmanskide/base.images.debian.11-bullseye.mandrel.22-2.java.17.mandrel-22-2-gradle-7-5-java-17
git clone https://github.com/ochmanskide/quarkus.code-with-quarkus.git /home/quarkus/code-with-quarkus
cd /home/quarkus/code-with-quarkus/
./mvnw package -Pnative
./target/code-with-quarkus-1.0.0-SNAPSHOT-runner
```

## 13. License
  
Copyright 2022 Lukasz Ochmanski  
  
Licensed under the Apache License, Version 2.0 (the "License");  
you may not use this file except in compliance with the License.  
You may obtain a copy of the License at  
  
    http://www.apache.org/licenses/LICENSE-2.0  
  
Unless required by applicable law or agreed to in writing, software  
distributed under the License is distributed on an "AS IS" BASIS,  
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  
See the License for the specific language governing permissions and  
limitations under the License.  
  
View license information for the software contained in this image.  
  
As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).  
  
Some additional license information which was able to be auto-detected might be found in the repo-info repository's gradle/ directory.  
  
As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.  
  
https://hub.docker.com/_/gradle  

## 14. Acknowledgments
https://github.com/vegardit/docker-graalvm-maven  

https://hub.docker.com/r/vegardit/graalvm-maven  

https://hub.docker.com/r/vegardit/graalvm-maven/tags  

https://github.com/graalvm/mandrel/releases/tag/mandrel-22.2.0.0-Final  


## 15. Frequently Asked Questions (FAQ)
### 15.1. Is this project OpenSource?
Yes, you can use this project in anyway you like. Feel free to copy, fork or do whatever you like with it.  
If you have questions about licensing, feel free to email me.  

### 15.2. How can I contact the maintainer?
if you have questions, feel free to send me an email: github@ochmanski.de  
I will be happy to help you.

### 15.2. Is this image compatible with AWS CodeBuild pipeline?
- yes, you could use it in the AWS environment, but you just need to install AWS-CLI.  
I already prepared a shell script `./scripts/install/05-install-aws-cli.sh` and `10-import-rds-certificates.sh`.  
Simply run it and you should be able to authenticate with all AWS resources.  
As an alternative, you may re-build the image from source and invoke the script directly from the `Dockerfile`.  
The result will be the same.