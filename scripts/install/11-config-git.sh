#!/usr/bin/env bash

set +x
set -e

git config --global user.name "AWS CodeBuild" \
    && git config --global user.email "your@domain.net" \
    && git config --global pager.branch false \
    && git config --global pager.tag false \
    && git config --global init.defaultBranch main
