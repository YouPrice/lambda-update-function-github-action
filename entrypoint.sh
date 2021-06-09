#!/bin/sh 

set -e

mkdir -p ~/.aws

touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

# comando per aggiornare la funzione lambda
aws lambda update-function-code \
  --function-name ${AWS_LAMBDA_NAME} \
  --zip-file ${ZIP_FILE} \
  --region ${AWS_REGION}
  
echo "AWS_LAYER_ARN=$LAYER_ARN" >> $GITHUB_ENV

rm -rf ~/.aws

