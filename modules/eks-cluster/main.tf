resource "aws_eks_cluster" "eks" {
  name     = "${var.eks-env-in}-cluster"
  role_arn = var.eks-cluster-role-arn-in
  version  = var.eks-cluster-version-in

  vpc_config {
    subnet_ids              = [var.eks-private-1-in, var.eks-private-2-in]
    endpoint_private_access = true
    endpoint_public_access  = true
  }
}

data "tls_certificate" "eks-tls-certificate" {
  url = aws_eks_cluster.eks.identity.0.oidc.0.issuer
}

resource "aws_eks_addon" "pod-identity-agent" {
  cluster_name                = aws_eks_cluster.eks.name
  addon_name                  = "eks-pod-identity-agent"
  resolve_conflicts_on_update = "PRESERVE"
}

resource "aws_eks_addon" "aws-ebs-csi-driver" {
  cluster_name                = aws_eks_cluster.eks.name
  addon_name                  = "aws-ebs-csi-driver"
  service_account_role_arn    = var.eks-ebs-csi-driver-role-arn-in
  resolve_conflicts_on_update = "PRESERVE"
}
