#!/bin/sh 

set -e

mkdir -p ~/.aws

touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

# comando per aggiornare layer 
# quello già usato 
# aws lambda publish-layer-version --layer-name my-layer --description "My layer" --license-info "MIT" --content S3Bucket=youprice-scraper-bucket,S3Key=layer.zip --compatible-runtimes python3.6 python3.7 python3.8 python3.9

aws s3 cp ${FILE} s3://${S3_BUCKET}/${S3_KEY} \
  --region ${AWS_REGION} $*

rm -rf ~/.aws

