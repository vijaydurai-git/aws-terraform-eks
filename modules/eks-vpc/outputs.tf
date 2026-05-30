output "eks-vpc-id-out" {
  value = aws_vpc.eks-vpc.id
}

output "eks-public-1-out" {
  value = aws_subnet.eks-public-1.id
}

output "eks-public-2-out" {
  value = aws_subnet.eks-public-2.id
}

output "eks-private-1-out" {
  value = aws_subnet.eks-private-1.id
}


output "eks-private-2-out" {
  value = aws_subnet.eks-private-2.id
}