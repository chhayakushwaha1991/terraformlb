resource "aws_lb_target_group" "tg" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
  deregistration_delay = 30
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.bar.id
  lb_target_group_arn    = aws_lb_target_group.tg.arn
}

resource "aws_lb_target_group" "tg1" {
  name     = "tf-example-lb-tg1"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
  deregistration_delay = 30
}

resource "aws_autoscaling_attachment" "asg_attachment_bar1" {
  autoscaling_group_name = aws_autoscaling_group.bar1.id
  lb_target_group_arn    = aws_lb_target_group.tg1.arn
}