resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lbsg.id]
  subnets            = [aws_subnet.publicsubnet.id, aws_subnet.privatesubnet.id]

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
         type = "forward"
        
          forward {
             target_group {
                arn = aws_lb_target_group.tg.arn
                }
               target_group {
               arn = aws_lb_target_group.tg1.arn
                  
          }
  }
}
}

# resource "aws_lb_listener" "front_end1" {
#   load_balancer_arn = aws_lb.test.arn
#   port              = "443"
#   protocol          = "HTTPS"
# #   ssl_policy        = "ELBSecurityPolicy-2016-08"
# #   certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.tg1.arn
#   }
# }