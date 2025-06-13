variable "region" { default = "us-east-1" }
variable "vpc_name" { default = "my-vpc" }
variable "subnet_name" { default = "my-subnet" }
variable "lambda_name" { default = "my-lambda" }
variable "lambda_s3_key" { description = "S3 key for Lambda zip" }
variable "schedule_expression" { default = "rate(1 day)" }
variable "lambda_ecr_image_uri" { description = "ECR image URI for Lambda" }