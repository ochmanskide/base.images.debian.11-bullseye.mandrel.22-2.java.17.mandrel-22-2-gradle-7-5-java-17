#!/usr/bin/env bash

set +x
set -e

# Install AWS CLI v2
# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /tmp/awscliv2.zip
unzip -q /tmp/awscliv2.zip -d /opt
/opt/aws/install --update -i /usr/local/aws-cli -b /usr/local/bin
rm /tmp/awscliv2.zip
rm -rf /opt/aws
aws --version
