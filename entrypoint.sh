#!/bin/sh 

set -e

mkdir -p ~/.aws

touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

# comando per aggiornare layer 
LAYER_ARN=casa
  
echo "AWS_LAYER_ARN=$LAYER_ARN" >> $GITHUB_ENV

echo ${AWS_LAYER_ARN}

rm -rf ~/.aws

