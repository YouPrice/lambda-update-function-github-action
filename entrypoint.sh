#!/bin/sh 

set -e

mkdir -p ~/.aws

touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

echo ${LAYER_NAME}
echo ${S3_BUCKET}
echo ${S3_KEY}
echo ${AWS_REGION}

# comando per aggiornare layer 
LAYER_ARN=$(aws lambda publish-layer-version \
  --layer-name ${LAYER_NAME} \
  --license-info "MIT" \
  --content S3Bucket=${S3_BUCKET},S3Key=${S3_KEY} \
  --region ${AWS_REGION} \
  --compatible-runtimes python3.6 python3.7 python3.8 python3.9)
  
echo "AWS_LAYER_ARN=$LAYER_ARN" >> $GITHUB_ENV

rm -rf ~/.aws

