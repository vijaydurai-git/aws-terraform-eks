resource "aws_eip" "eks_eip" {
  domain = "vpc"

  tags = {
    Name = "eks_eip"
  }
}


resource "aws_nat_gateway" "eks_nat_gateway" {
  allocation_id     = aws_eip.eks_eip.id
  subnet_id         = var.eks_public_1_in
  connectivity_type = "public"

  tags = {
    Name = "eks_nat_gateway"
  }
}