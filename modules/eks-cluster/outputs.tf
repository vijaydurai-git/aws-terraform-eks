output "eks-cluster-id-out" {
  value = aws_eks_cluster.eks.id
}


output "eks_cluster_sg_id_out" {
  value = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id

}

output "eks-cluster-oidc-issuer-out" { #isssuer means url
  value = aws_eks_cluster.eks.identity[0].oidc[0].issuer

}


output "eks-cluster-oidc-thumbprint-out" {
  value = data.tls_certificate.eks-tls-certificate.certificates[0].sha1_fingerprint
}

output "eks-cluster-endpoint-out" {
  value = aws_eks_cluster.eks.endpoint
}








