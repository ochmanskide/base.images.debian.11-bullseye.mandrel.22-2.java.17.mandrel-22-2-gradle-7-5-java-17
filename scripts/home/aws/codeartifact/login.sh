#!/usr/bin/env bash

set -o allexport
export AWS_DEFAULT_REGION=eu-central-1
export AWS_CODEARTIFACT_DOMAIN=abcdef
export AWS_CODEARTIFACT_DOMAIN_OWNER=12345678
export AWS_CODEARTIFACT_PROFILE=$AWS_PROFILE
export AWS_CODEARTIFACT_USER=aws
CODEARTIFACT_AUTH_TOKEN=$(aws codeartifact get-authorization-token --domain "$AWS_CODEARTIFACT_DOMAIN" --domain-owner "$AWS_CODEARTIFACT_DOMAIN_OWNER" --query authorizationToken --output text)
export CODEARTIFACT_AUTH_TOKEN
if [ -z "$CODEARTIFACT_AUTH_TOKEN" ]
then
  echo
  echo "CodeArtifact Login Failed"
  echo Unauthorized
  exit 1
else
  echo
  echo "[5%] CodeArtifact Login Succeeded"
fi
