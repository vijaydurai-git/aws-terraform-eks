resource "aws_subnet" "eks-public-1" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = "10.10.0.0/20"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.eks-env-in}-eks-public-1"
  }
}

resource "aws_subnet" "eks-public-2" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = "10.10.16.0/20"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.eks-env-in}-eks-public-2"
  }
}

resource "aws_subnet" "eks-private-1" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = "10.10.32.0/20"
  availability_zone = "us-east-2a"

  tags = {
    Name = "${var.eks-env-in}-eks-private-1"
  }
}

resource "aws_subnet" "eks-private-2" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = "10.10.48.0/20"
  availability_zone = "us-east-2b"
  tags = {
    Name = "${var.eks-env-in}-eks-private-2"
  }
}
