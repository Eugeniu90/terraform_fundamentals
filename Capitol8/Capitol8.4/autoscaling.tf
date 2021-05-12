resource "aws_launch_configuration" "telacad-nodes-launch-configurare" {
  name_prefix     = "telacad-nodes-launch-configurare"
  image_id        = var.AMIS[var.AWS_REGION]
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.telacad_key.key_name
  security_groups = [aws_security_group.telacad_node.id]
}

resource "aws_autoscaling_group" "telacad-autoscalling" {
  name                      = "telacad-autoscalling"
  vpc_zone_identifier       = [aws_subnet.public-principal-1.id, aws_subnet.public-principal-2.id]
  launch_configuration      = aws_launch_configuration.telacad-nodes-launch-configurare.name
  min_size                  = 2
  max_size                  = 4
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true

  tag {

    propagate_at_launch = true
    key                 = "Name"
    value               = "EC2 instance"
  }
}

