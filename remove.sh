#!/bin/bash

BUCKET=`echo blek-bucket-poc`
REGION=us-east-1

# Create the S3 bucket
aws cloudformation create-stack

# Upload the files recursively

aws s3api create-bucket --region $REGION --bucket $BUCKET
aws s3 cp . s3://$BUCKET/ --recursive

aws cloudformation create-stack --region $REGION --stack-name blek --template-body file://blek.yaml --parameters  ParameterKey=S3Bucket,ParameterValue=$BUCKET  --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM

aws cloudformation update-stack --region $REGION --stack-name blek --template-body file://blek.yaml --parameters  ParameterKey=S3Bucket,ParameterValue=$BUCKET  --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM
