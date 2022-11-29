resource "aws_autoscaling_group" "bar" {
   launch_configuration = "${aws_launch_configuration.lconf.id}"
  #availability_zones = ["us-west-2a"]
  desired_capacity   = 3
  max_size           = 5
  min_size           = 1
   vpc_zone_identifier       = [aws_subnet.publicsubnet.id, aws_subnet.privatesubnet.id]

  # launch_template {
  #   id      = aws_launch_template.foo.id
  #   version = "$Latest"
  # }

   lifecycle {
   create_before_destroy = true
   ignore_changes = [
      # Replace `aws_appautoscaling_target` each time this instance of
      # the `aws_ecs_service` is replaced.
      target_group_arns
    ]
}
}

resource "aws_autoscaling_group" "bar1" {
   launch_configuration = "${aws_launch_configuration.lconf1.id}"
  #availability_zones = ["us-west-2a"]
  desired_capacity   = 3
  max_size           = 5
  min_size           = 1
   vpc_zone_identifier       = [aws_subnet.publicsubnet.id, aws_subnet.privatesubnet.id]

  # launch_template {
  #   id      = aws_launch_template.foo.id
  #   version = "$Latest"
  # }

   lifecycle {
   create_before_destroy = true
   ignore_changes = [
      # Replace `aws_appautoscaling_target` each time this instance of
      # the `aws_ecs_service` is replaced.
      target_group_arns
    ]
}
}

resource "aws_autoscaling_group" "bar2" {
   launch_configuration = "${aws_launch_configuration.lconf.id}"
  #availability_zones = ["us-west-2a"]
  desired_capacity   = 3
  max_size           = 5
  min_size           = 1
   vpc_zone_identifier       = [aws_subnet.publicsubnet.id, aws_subnet.privatesubnet.id]

  # launch_template {
  #   id      = aws_launch_template.foo.id
  #   version = "$Latest"
  # }

   lifecycle {
   ignore_changes = [
      # Replace `aws_appautoscaling_target` each time this instance of
      # the `aws_ecs_service` is replaced.
      target_group_arns
    ]
}
}