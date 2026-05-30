
# VPC Outputs

output "eks-vpc-id-out" {
  description = "EKS VPC ID"
  value       = module.vpc-module.eks-vpc-id-out
}

output "eks-public-subnets-out" {
  description = "Public subnets for EKS"
  value       = [module.vpc-module.eks-public-1-out, module.vpc-module.eks-public-2-out]
}

output "eks-private-subnets-out" {
  description = "Private subnets for EKS"
  value       = [module.vpc-module.eks-private-1-out, module.vpc-module.eks-private-2-out]
}


# NAT Gateway Outputs

output "eks-nat-gateway-id-out" {
  description = "NAT Gateway ID"
  value       = module.nat-gateway-module.eks-nat-gateway-id-out
}


# IAM Outputs

output "eks-cluster-role-arn-out" {
  description = "EKS Cluster IAM Role ARN"
  value       = module.iam-module.eks-cluster-role-arn-out
}

output "eks-node-role-arn-out" {
  description = "EKS Node Group IAM Role ARN"
  value       = module.iam-module.eks-node-role-arn-out
}


# Cluster Outputs

output "eks-cluster-id-out" {
  description = "EKS Cluster ID"
  value       = module.cluster-module.eks-cluster-id-out
}

output "eks-cluster-endpoint-out" {
  description = "EKS Cluster API Endpoint"
  value       = module.cluster-module.eks-cluster-endpoint-out
}

output "eks-cluster-oidc-issuer-out" {
  description = "EKS Cluster OIDC Issuer URL"
  value       = module.cluster-module.eks-cluster-oidc-issuer-out
}

output "eks-cluster-oidc-thumbprint-out" {
  description = "EKS Cluster OIDC Thumbprint"
  value       = module.cluster-module.eks-cluster-oidc-thumbprint-out
}

# Node Group Outputs

output "eks-node-group-ids-out" {
  description = "EKS Node Group IDs"
  value       = module.node-module.eks-node-group-ids-out
}

output "eks-node-launch-template-id-out" {
  description = "EKS Node Launch Template ID"
  value       = module.node-group-template.eks-node-launch-template-id-out
}
