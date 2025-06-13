#!/bin/bash
set -e

# Usage: •/deploy.sh <lambda_ecr_image_uri> [vpc_name] [subnet_name] [lambda_name]
LAMBDA_ECR_IMAGE_URI="$1"
VPC_NAME="${2:-my-vpc-$RANDOM}"
SUBNET_NAME="${3:-my-subnet-$RANDOM}"
LAMBDA_NAME="${4:-my-Lambda-$RANDOM}"
export TF_VAR_lambda_ecr_image_uri="$LAMBDA_ECR_IMAGE_URI"
export TF_VAR_vpc_name="$VPC_NAME"
export TF_VAR_subnet_name="$SUBNET_NAME"
export TF_VAR_lambda_name="$LAMBDA_NAME"

terraform init
terraform apply -auto-approve