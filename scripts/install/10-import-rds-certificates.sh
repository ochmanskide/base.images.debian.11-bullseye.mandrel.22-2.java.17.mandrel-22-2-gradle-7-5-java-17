#!/usr/bin/env bash

set +x
set -e

/home/aws/import-rds-certs.sh
rm /home/aws/import-rds-certs.sh
