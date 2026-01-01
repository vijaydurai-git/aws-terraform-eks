module "vpc_module" {

  source                = "../modules/eks-vpc"
  eks_nat_gateway_id_in = module.nat_gateway_module.eks_nat_gateway_id_out


}

module "nat_gateway_module" {

  source          = "../modules/eks-nat-gateway"
  eks_public_1_in = module.vpc_module.eks_public_1_out

}

module "iam_module" {

  source                         = "../modules/eks-iam"
  eks_cluster_oidc_issuer_in     = module.cluster_module.eks_cluster_oidc_issuer_out
  eks_cluster_oidc_thumbprint_in = module.cluster_module.eks_cluster_oidc_thumbprint_out

}

module "cluster_module" {

  source                  = "../modules/eks-cluster"
  eks_cluster_role_arn_in = module.iam_module.eks_cluster_role_arn_out
  eks_public_1_in         = module.vpc_module.eks_public_1_out
  eks_public_2_in         = module.vpc_module.eks_public_2_out
  eks_private_1_in        = module.vpc_module.eks_private_1_out
  eks_private_2_in        = module.vpc_module.eks_private_2_out

}


module "node_module" {

  source                         = "../modules/eks-node-group"
  eks_cluster_id_in              = module.cluster_module.eks_cluster_id_out
  eks_node_role_arn_in           = module.iam_module.eks_node_role_arn_out
  eks_public_1_in                = module.vpc_module.eks_public_1_out
  eks_public_2_in                = module.vpc_module.eks_public_2_out
  eks_private_1_in               = module.vpc_module.eks_private_1_out
  eks_private_2_in               = module.vpc_module.eks_private_2_out
  eks_node_launch_template_id_in = module.node_group_template.eks_node_launch_template_id_out
  eks_node_desired_size_in       = var.eks_node_desired_size
  eks_node_max_size_in           = var.eks_node_max_size
  eks_node_min_size_in           = var.eks_node_min_size

}

module "node_group_template" {

  source                                       = "../modules/eks-node-group-template"
  eks_node_group_template_instance_key_name_in = var.eks_node_group_template_instance_key_name
  eks_node_group_template_instance_type_in     = var.eks_node_group_template_instance_type
}

