#eks-node-group-template dynamic values


variable "eks-node-group-template-instance-key-name" {
  default = "jkey"
}

variable "eks-node-group-template-instance-type" {
  default = "t3.small"
}


variable "eks-node-desired-size" {
  default = 2
}

variable "eks-node-max-size" {
  default = 3
}
variable "eks-node-min-size" {
  default = 1
}

variable "eks-cluster-version" {
  default = "1.30"
}

variable "eks-env" {}