#!/bin/bash
set -xe;
sam package \
  --profile s3mail \
  --region us-east-1 \
  --template-file template.yml \
  --output-template-file output_template.yml \
  --s3-bucket s3mail.artifacts \
  --debug;
sam deploy \
  --profile s3mail \
  --region us-east-1 \
  --template-file ./output_template.yml \
  --stack-name "s3mail" \
  --s3-bucket s3mail.artifacts \
  --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND;
