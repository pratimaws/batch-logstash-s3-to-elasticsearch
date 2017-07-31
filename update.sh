#!/bin/bash

REGION=us-east-1
STACK_S3_NAME=blek-s3
STACK=blek

# # Create the S3 bucket
# aws cloudformation create-stack --stack-name $STACK_S3_NAME --region $REGION --template-body file://../templates/blek-s3.yaml
# aws cloudformation wait stack-create-complete --region $REGION --stack-name $STACK_S3_NAME
#
# # Upload the nested stacks
BUCKET=`aws cloudformation list-exports --region us-east-1 | jq -r '.Exports[] | select(.Name == "blek-S3Bucket") | .Value'`
aws s3 cp ../templates/ s3://$BUCKET/ --recursive

# Create the templates
aws cloudformation update-stack --stack-name $STACK --region $REGION --template-body file://../templates/blek.yaml --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM
