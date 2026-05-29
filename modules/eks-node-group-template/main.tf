resource "aws_launch_template" "eks_node_launch_template" {
  name_prefix   = "eks-node-group-template"
  instance_type = var.eks_node_group_template_instance_type_in
  key_name      = var.eks_node_group_template_instance_key_name_in




  block_device_mappings {
    device_name = "/dev/xvda" # Ensure this matches your AMI's expected device name
    ebs {
      volume_size = 20
      volume_type = "gp2" # Specify volume type if needed
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = "eks-node"
      Environment = "local"
      Owner       = "vijaydurai"
    }
  }

}