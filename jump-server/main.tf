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
  vpc_id                            = "vpc-05deec794c0d4e0c1"
  subnet_id                         = "subnet-04243c22075f1627f"
  iam_role_permissions_boundary_arn = "arn:aws:iam::590788709872:policy/CP-Service-Policy"
  deployment_name                   = "epamcora-terraform"
  deployment_env                    = "epamcora-terraform"
}