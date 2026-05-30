resource "aws_eks_node_group" "node-grp" {
  cluster_name    = var.eks-cluster-id-in
  node_group_name = "${var.eks-env-in}-eks-node-group"
  node_role_arn   = var.eks-node-role-arn-in
  subnet_ids      = [var.eks-private-1-in, var.eks-private-2-in]
  capacity_type   = "ON_DEMAND"

  scaling_config {
    desired_size = var.eks-node-desired-size-in
    max_size     = var.eks-node-max-size-in
    min_size     = var.eks-node-min-size-in
  }

  update_config {
    max_unavailable = 1
  }

  launch_template {
    id      = var.eks-node-launch-template-id-in
    version = "$Latest"
  }

  tags = {
    "k8s.io/cluster-autoscaler/enabled"                  = "true"
    "k8s.io/cluster-autoscaler/${var.eks-cluster-id-in}" = "owned"
  }
}
