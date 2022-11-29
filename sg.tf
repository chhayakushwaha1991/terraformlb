locals {
  ports_in = [
    443,
    80,
    22,
    8080
  ]
  ports_out = [
    0
  ]
}

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.my_vpc.id
  
   dynamic "ingress" {
    for_each = toset(local.ports_in)
    content {
      description      = "HTTPS from VPC"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = toset(local.ports_out)
    content {
      from_port        = egress.value
      to_port          = egress.value
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "lbsg" {
  vpc_id = aws_vpc.my_vpc.id
  
   dynamic "ingress" {
    for_each = toset(local.ports_in)
    content {
      description      = "HTTPS from VPC"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = toset(local.ports_out)
    content {
      from_port        = egress.value
      to_port          = egress.value
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "allow_tls"
  }
}
