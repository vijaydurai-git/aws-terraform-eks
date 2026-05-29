resource "aws_eks_cluster" "eks" {
  name     = "eks-cluster"
  role_arn = var.eks_cluster_role_arn_in
  version  = var.eks_cluster_version_in

  vpc_config {
    subnet_ids              = [var.eks_private_1_in, var.eks_private_2_in]
    endpoint_private_access = true
    endpoint_public_access  = true
  }
}

data "tls_certificate" "eks_tls_certificate" {
  url = aws_eks_cluster.eks.identity.0.oidc.0.issuer
}

resource "aws_eks_addon" "pod_identity_agent" {
  cluster_name                = aws_eks_cluster.eks.name
  addon_name                  = "eks-pod-identity-agent"
  resolve_conflicts_on_update = "PRESERVE"
}

resource "aws_eks_addon" "aws_ebs_csi_driver" {
  cluster_name                = aws_eks_cluster.eks.name
  addon_name                  = "aws-ebs-csi-driver"
  service_account_role_arn    = var.eks_ebs_csi_driver_role_arn_in
  resolve_conflicts_on_update = "PRESERVE"
}
