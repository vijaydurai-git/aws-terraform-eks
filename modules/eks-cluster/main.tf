resource "aws_eks_cluster" "eks" {
  name     = "${var.eks-env-in}-eks-cluster"
  role_arn = var.eks-cluster-role-arn-in
  version  = var.eks-cluster-version-in

  vpc_config {
    subnet_ids              = [var.eks-private-1-in, var.eks-private-2-in]
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = false
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

data "aws_caller_identity" "eks-admin-account" {}

resource "aws_eks_access_entry" "eks-admin-user" {
  cluster_name  = aws_eks_cluster.eks.name
  principal_arn = "arn:aws:iam::${data.aws_caller_identity.eks-admin-account.account_id}:user/${var.eks-admin-username-in}"
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "eks-admin-policy" {
  cluster_name  = aws_eks_cluster.eks.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = aws_eks_access_entry.eks-admin-user.principal_arn

  access_scope {
    type = "cluster"
  }
}
