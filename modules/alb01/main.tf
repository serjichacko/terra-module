##ALB
resource "aws_lb" "test_alb" {
  name               = "test-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg]
  subnets            = [var.subnet01,var.subnet02]

  enable_deletion_protection = false

  tags = {
    Environment = "testort"
    Name = "test_alb"
  }
}

resource "aws_lb_target_group" "backend-tg" {
  name     = "backend-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_target_group" "contact-socket" {
  name     = "contact-socket-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_target_group" "logging-service" {
  name     = "logging-service-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_target_group" "registration-service" {
  name     = "registration-service-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "backend-tgs" {
  target_group_arn = aws_lb_target_group.backend-tg.arn
  target_id        = var.backend01
  port             = 80
}
resource "aws_lb_target_group_attachment" "contact-socket-tgs" {
  target_group_arn = aws_lb_target_group.contact-socket.arn
  target_id        = var.contact_socket
  port             = 3005
}
resource "aws_lb_target_group_attachment" "logging-sevice-tgs" {
  target_group_arn = aws_lb_target_group.logging-service.arn
  target_id        = var.logging_sevice
  port             = 80
}
resource "aws_lb_target_group_attachment" "test-tgs" {
  target_group_arn = aws_lb_target_group.registration-service.arn
  target_id        = var.registration
  port             = 80
}
resource "aws_lb_listener" "test-ort" {
  load_balancer_arn = aws_lb.test_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:eu-west-1:659018046057:certificate/a46086c5-19e3-41ba-bde5-2773a5cb8097"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend-tg.arn
  }
}
 resource "aws_lb_listener_rule" "logging" {
  listener_arn = aws_lb_listener.test-ort.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.logging-service.arn
  }
  condition {
   path_pattern {
      values = ["/api/log*"]
  } 
}
condition {
    host_header {
      values = ["service40.secureother.com"]
    }
  }
}
resource "aws_lb_listener_rule" "socket" {
  listener_arn = aws_lb_listener.test-ort.arn
  priority     = 101

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.contact-socket.arn
  }
  condition {
   path_pattern {
      values = ["/socket.io*"]
  }
}
condition {
    host_header {
      values = ["service40.secureother.com"]
    }
  }
}
resource "aws_lb_listener_rule" "registration" {
  listener_arn = aws_lb_listener.test-ort.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.registration-service.arn
  }

  condition {
    host_header {
      values = ["service43.secureother.com"]
    }
  }
}
resource "aws_lb_listener_certificate" "testort-crt" {
  listener_arn    = aws_lb_listener.test-ort.arn 
  certificate_arn = "arn:aws:acm:eu-west-1:659018046057:certificate/a46086c5-19e3-41ba-bde5-2773a5cb8097"
}