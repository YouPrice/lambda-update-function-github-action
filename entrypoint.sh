#!/bin/sh 

set -e

mkdir -p ~/.aws

touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

# comando per aggiornare layer 
aws lambda publish-layer-version \
  --layer-name ${LAYER_NAME} \
  --license-info "MIT" \
  --content S3Bucket=${S3_BUCKET},S3Key=${S3_KEY} \
  --compatible-runtimes python3.6 python3.7 python3.8 python3.9

rm -rf ~/.aws

