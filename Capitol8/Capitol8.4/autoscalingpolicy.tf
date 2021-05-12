# Cream regula de alarma pentru scaleDown

resource "aws_autoscaling_policy" "cpu-regula-scaledown" {
  name                   = "cpu-regula-scaledown"
  autoscaling_group_name = aws_autoscaling_group.telacad-autoscalling.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "2"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarma-scaledown" {
  alarm_name          = "cpu-alarma-scaledown"
  alarm_description   = "cpu-alarma-scaledown"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.telacad-autoscalling.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.cpu-regula-scaledown.arn]
}

#  Cream regula de alarma pentru scaleDown
resource "aws_autoscaling_policy" "cpu-regula-scaledown" {
  name                   = "cpu-regula-scaledown"
  autoscaling_group_name = aws_autoscaling_group.telacad-autoscalling.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarma-scaledown" {
  alarm_name          = "cpu-alarma-scaledown"
  alarm_description   = "cpu-alarma-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.telacad-autoscalling.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.cpu-regula-scaledown.arn]
}

