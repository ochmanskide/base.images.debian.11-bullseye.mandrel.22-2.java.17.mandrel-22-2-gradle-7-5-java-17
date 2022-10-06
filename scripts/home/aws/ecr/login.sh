#!/usr/bin/env bash

set +x
set -e

discardWarning () {
  if grep -Fq "Login Succeeded" output.tmp_file ;
  then
    echo "[3%] ECR Login Succeeded"
  else
    echo "ECR Login Failed"
    cat output.tmp_file
    exit 1
  fi
  rm output.tmp_file
}

aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $HOST > output.tmp_file 2>&1
echo
discardWarning
