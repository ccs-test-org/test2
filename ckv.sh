#!/bin/bash
# CLI usage
if [ $# -lt 1 ]
then
  echo 1>&2 "$0: not enough arguments\n"
  echo "Usage: ckv.sh <check_id>\n"
  exit 1
fi

# Variables settings
ID=$1

CMD="checkov -f case$ID.tf --external-checks-dir . -c case$ID"
# CMD="checkov -f case$ID.tf --external-checks-dir . -c case$ID --compact"
echo "### Executing: $CMD"

# Checkov scan
$CMD
