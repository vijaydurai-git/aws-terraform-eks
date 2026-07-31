module "vpc-module" {

  source                = "../../modules/eks-vpc"
  eks-nat-gateway-id-in = module.nat-gateway-module.eks-nat-gateway-id-out
  eks-env-in            = var.eks-env


}

module "nat-gateway-module" {

  source          = "../../modules/eks-nat-gateway"
  eks-public-1-in = module.vpc-module.eks-public-1-out
  eks-env-in      = var.eks-env

}

module "iam-module" {

  source                         = "../../modules/eks-iam"
  eks-cluster-oidc-issuer-in     = module.cluster-module.eks-cluster-oidc-issuer-out
  eks-cluster-oidc-thumbprint-in = module.cluster-module.eks-cluster-oidc-thumbprint-out
  eks-env-in                     = var.eks-env

}

module "cluster-module" {

  source                         = "../../modules/eks-cluster"
  eks-cluster-role-arn-in        = module.iam-module.eks-cluster-role-arn-out
  eks-cluster-version-in         = var.eks-cluster-version
  eks-public-1-in                = module.vpc-module.eks-public-1-out
  eks-public-2-in                = module.vpc-module.eks-public-2-out
  eks-private-1-in               = module.vpc-module.eks-private-1-out
  eks-private-2-in               = module.vpc-module.eks-private-2-out
  eks-ebs-csi-driver-role-arn-in = module.iam-module.eks-ebs-csi-driver-role-arn-out
  eks-env-in                     = var.eks-env

}


module "node-module" {

  source                         = "../../modules/eks-node-group"
  eks-cluster-id-in              = module.cluster-module.eks-cluster-id-out
  eks-node-role-arn-in           = module.iam-module.eks-node-role-arn-out
  eks-public-1-in                = module.vpc-module.eks-public-1-out
  eks-public-2-in                = module.vpc-module.eks-public-2-out
  eks-private-1-in               = module.vpc-module.eks-private-1-out
  eks-private-2-in               = module.vpc-module.eks-private-2-out
  eks-node-launch-template-id-in = module.node-group-template.eks-node-launch-template-id-out
  eks-node-desired-size-in       = var.eks-node-desired-size
  eks-node-max-size-in           = var.eks-node-max-size
  eks-node-min-size-in           = var.eks-node-min-size
  eks-env-in                     = var.eks-env

}

module "node-group-template" {

  source                                       = "../../modules/eks-node-group-template"
  eks-node-group-template-instance-key-name-in = var.eks-node-group-template-instance-key-name
  eks-node-group-template-instance-type-in     = var.eks-node-group-template-instance-type
  eks-env-in                                   = var.eks-env
}
