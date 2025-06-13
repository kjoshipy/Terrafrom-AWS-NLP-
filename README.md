# Terraform-NLP-Resources


This repository provides Terraform scripts and a deployment Bash script to provision AWs infrastructure for NLP workloads, including:

- A VPC
- A subnet
- An AWS Lambda function deployed from an ECR Docker image
- Scheduled Lambda execution (e.g., daily)

## Usage

1.**Build and push your Lambda Docker image to ECR.**
2.**Run the deployment script:**
  ```bash
•/deploy-sh « lambda _ecr image uri> [vpc name] [subnet name] [lambda_ namell
