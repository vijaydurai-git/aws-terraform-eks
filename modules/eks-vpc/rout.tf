resource "aws_route_table" "eks-public-route-table" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-vpc-igw.id
  }

  tags = {
    Name = "${var.eks-env-in}-public-route-table"
  }
}


resource "aws_route_table_association" "eks-public-route-as-1" {
  subnet_id      = aws_subnet.eks-public-1.id
  route_table_id = aws_route_table.eks-public-route-table.id
}

resource "aws_route_table_association" "eks-public-route-as-2" {
  subnet_id      = aws_subnet.eks-public-2.id
  route_table_id = aws_route_table.eks-public-route-table.id
}


resource "aws_route_table" "eks-private-route-table" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.eks-nat-gateway-id-in
  }

  tags = {
    Name = "${var.eks-env-in}-private-route-table"
  }
}

resource "aws_route_table_association" "eks-private-route-as-1" {
  subnet_id      = aws_subnet.eks-private-1.id
  route_table_id = aws_route_table.eks-private-route-table.id
}

resource "aws_route_table_association" "eks-private-route-as-2" {
  subnet_id      = aws_subnet.eks-private-2.id
  route_table_id = aws_route_table.eks-private-route-table.id
}