#eks-node-group-template dynamic values


variable "eks_node_group_template_instance_key_name" {
  default = "jkey"
}

variable "eks_node_group_template_instance_type" {
  default = "t3.small"
}


variable "eks_node_desired_size" {
  default = 2
}

variable "eks_node_max_size" {
  default = 3
}
variable "eks_node_min_size" {
  default = 1
}