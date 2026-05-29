output "eks_node_group_ids_out" {
  description = "EKS Node Group IDs"
  value       = [aws_eks_node_group.node-grp.id]
}