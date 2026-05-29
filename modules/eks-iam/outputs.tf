output "eks_cluster_role_arn_out" {
  value = aws_iam_role.eks_cluster.arn
}


output "eks_cluster_role_id_out" {
  value = aws_iam_role.eks_cluster.id
}


output "eks_node_role_arn_out" {
  value = aws_iam_role.eks_node.arn
}


output "eks_node_role_id_out" {
  value = aws_iam_role.eks_node.id
}

output "eks_cluster_oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.eks_oidc.arn
}

output "eks_ebs_csi_driver_role_arn_out" {
  value = aws_iam_role.eks_ebs_csi_driver_role.arn
}