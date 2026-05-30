resource "aws_launch_template" "eks-node-launch-template" {
  name_prefix   = "${var.eks-env-in}-node-group-template"
  instance_type = var.eks-node-group-template-instance-type-in
  key_name      = var.eks-node-group-template-instance-key-name-in




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
      Name        = "${var.eks-env-in}-node"
      Environment = "local"
      Owner       = "vijaydurai"
    }
  }

}