resource "aws_eip" "eks-eip" {
  domain = "vpc"

  tags = {
    Name = "${var.eks-env-in}-eks-eip"
  }
}


resource "aws_nat_gateway" "eks-nat-gateway" {
  allocation_id     = aws_eip.eks-eip.id
  subnet_id         = var.eks-public-1-in
  connectivity_type = "public"

  tags = {
    Name = "${var.eks-env-in}-eks-nat-gateway"
  }
}