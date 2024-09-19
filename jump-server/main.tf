terraform {
  backend "s3" {
    bucket         = "5907-terraform-epam-cora"
    key            = "cora1-jumpbox/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "epam-cora-terraform"
  }
  required_version = "1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

module jump-server {
  source                            = "git::https://github.com/epam/cloud-pipeline//deploy/infra/aws/terraform/cloud-native/jump-server?ref=f_aws_native_infra"
  vpc_id                            = "vpc-0ea691b9b6fe97388"
  subnet_id                         = "subnet-0abe89f1f176a7605"
  iam_role_permissions_boundary_arn = "arn:aws:iam::590788709872:policy/CP-Service-Policy"
  deployment_name                   = "epamcora1"
  deployment_env                    = "cora-env1"
}
