resource "aws_vpc" "eks-vpc" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "${var.eks-env-in}-vpc"
  }
}