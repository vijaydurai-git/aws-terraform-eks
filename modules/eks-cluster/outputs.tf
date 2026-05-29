output "eks_cluster_id_out" {
  value = aws_eks_cluster.eks.id
}


output "eks_cluster_sg_id_out" {
  value = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id

}

output "eks_cluster_oidc_issuer_out" { #isssuer means url
  value = aws_eks_cluster.eks.identity[0].oidc[0].issuer

}


output "eks_cluster_oidc_thumbprint_out" {
  value = data.tls_certificate.eks_tls_certificate.certificates[0].sha1_fingerprint
}

output "eks_cluster_endpoint_out" {
  value = aws_eks_cluster.eks.endpoint
}








