output "eks-cluster-role-arn-out" {
  value = aws_iam_role.eks-cluster.arn
}


output "eks_cluster_role_id_out" {
  value = aws_iam_role.eks-cluster.id
}


output "eks-node-role-arn-out" {
  value = aws_iam_role.eks-node.arn
}


output "eks_node_role_id_out" {
  value = aws_iam_role.eks-node.id
}

output "eks_cluster_oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.eks-oidc.arn
}

output "eks-ebs-csi-driver-role-arn-out" {
  value = aws_iam_role.eks-ebs-csi-driver-role.arn
}