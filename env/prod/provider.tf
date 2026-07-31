terraform {
  backend "s3" {
    bucket         = "aws-terraform-statefiles-bucket"
    key            = "prod/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "aws-terraform-statefiles-lock"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.47.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.3.0"
    }
  }
}

# Configure the AWS Provider

provider "aws" {

  region                   = "us-east-2"
  shared_credentials_files = ["/home/e1087/devops/awsInfra/.aws/credentials"]

}
