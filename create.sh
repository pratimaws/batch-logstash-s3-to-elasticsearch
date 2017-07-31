#!/bin/bash

REGION=eu-west-1
STACK_S3_NAME=hprudent-projects
STACK=blog

aws s3 sync . s3://$STACK_S3_NAME

# Create the templates
# aws cloudformation create-stack --stack-name $STACK --region $REGION --template-body file://main.yaml --parameters ParameterKey=TemplateBucket,ParameterValue=hprudent-projects --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM
aws cloudformation update-stack --stack-name $STACK --region $REGION --template-body file://main.yaml --parameters ParameterKey=TemplateBucket,ParameterValue=hprudent-projects --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM
