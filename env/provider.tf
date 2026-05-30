terraform {
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