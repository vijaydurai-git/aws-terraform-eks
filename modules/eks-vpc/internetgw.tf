resource "aws_internet_gateway" "eks-vpc-igw" {
  vpc_id = aws_vpc.eks-vpc.id

  tags = {
    Name = "${var.eks-env-in}-eks-vpc-igw"
  }
}