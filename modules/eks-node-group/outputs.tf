output "eks-node-group-ids-out" {
  description = "EKS Node Group IDs"
  value       = [aws_eks_node_group.node-grp.id]
}