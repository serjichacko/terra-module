#################cassandra##############################
resource "aws_lb" "cassandranlb" {
  name               = "cassandranlb"
  internal           = true
  load_balancer_type = "network"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection = false
  subnets            = [var.subprv01,var.subprv02]
  tags = {
    Name = "cassandranlb"
    env = "testort"
  }
}

resource "aws_lb_target_group" "cassandra-tg" {
  name     = "cassandra-tg"
  port     = 9042
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "cassandra-tgs" {
  target_group_arn = aws_lb_target_group.cassandra-tg.arn
  target_id        = var.cassandra01
  port             = 9042
}

resource "aws_lb_listener" "cassandra-nlb" {
  load_balancer_arn = aws_lb.cassandranlb.arn
  port              = "9042"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cassandra-tg.arn
  }
}
###############Elasticsearch##################################
resource "aws_lb" "elasticsearchnlb" {
  name               = "elasticsearchnlb"
  internal           = true
  load_balancer_type = "network"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection = false
  subnets            = [var.subprv01,var.subprv02]
  tags = {
    Name = "elasticsearchnlb"
    env = "testort"
  }
}

resource "aws_lb_target_group" "elasticsearch-tg" {
  name     = "elasticsearch-tg"
  port     = 9200
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "elasticsearch-tgs" {
  target_group_arn = aws_lb_target_group.elasticsearch-tg.arn
  target_id        = var.elasticsearch01
  port             = 9200
}

resource "aws_lb_listener" "elasticsearch-nlb" {
  load_balancer_arn = aws_lb.elasticsearchnlb.arn
  port              = "9200"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.elasticsearch-tg.arn
  }
}

########################mysql##################################
resource "aws_lb" "mysqlnlb" {
  name               = "mysqlnlb"
  internal           = true
  load_balancer_type = "network"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection = false
  subnets            = [var.subprv01,var.subprv02]
  tags = {
    Name = "mysqlnlb"
    env = "testort"
  }
}

resource "aws_lb_target_group" "mysql-tg" {
  name     = "mysql-tg"
  port     = 3306
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "mysql-tgs" {
  target_group_arn = aws_lb_target_group.mysql-tg.arn
  target_id        = var.mysql01
  port             = 3306
}

resource "aws_lb_listener" "mysql-nlb" {
  load_balancer_arn = aws_lb.mysqlnlb.arn
  port              = "3306"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mysql-tg.arn
  }
}

#######################################rabbitmq###################################
resource "aws_lb" "rabbitmqnlb" {
  name               = "rabbitmqnlb"
  internal           = true
  load_balancer_type = "network"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection = false
  subnets            = [var.subprv01,var.subprv02]
  tags = {
    Name = "rabbitmqnlb"
    env = "testort"
  }
}
resource "aws_lb_target_group" "rabbitmqmnt-tg" {
  name     = "rabbitmqmnt-tg"
  port     = 15672
  protocol = "TCP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_target_group" "rabbitmqdata-tg" {
  name     = "rabbitmqdata-tg"
  port     = 5672
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "rabbitmqmnt-tgs" {
  target_group_arn = aws_lb_target_group.rabbitmqmnt-tg.arn
  target_id        = var.rabbitmq01
  port             = 15672
}
resource "aws_lb_target_group_attachment" "rabbitmqdata-tgs" {
  target_group_arn = aws_lb_target_group.rabbitmqdata-tg.arn
  target_id        = var.rabbitmq01
  port             = 5672
}

resource "aws_lb_listener" "rabbitmqmnt-nlb" {
  load_balancer_arn = aws_lb.rabbitmqnlb.arn
  port              = "15672"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rabbitmqmnt-tg.arn
  }
}
resource "aws_lb_listener" "rabbitmqdata-nlb" {
  load_balancer_arn = aws_lb.rabbitmqnlb.arn
  port              = "5672"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rabbitmqdata-tg.arn
  }
}
########################mongooseim-intern########################3
resource "aws_lb" "mongooseimintrnlb" {
  name               = "mongooseimintrnlb"
  internal           = true
  load_balancer_type = "network"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection = false
  subnets            = [var.subpub01,var.subpub02]
  tags = {
    Name = "mongooseimintrnlb"
    env = "testort"
  }
}
resource "aws_lb_target_group" "mongooseimintr-5280" {
  name     = "mongooseimintr-5280"
  port     = 5280
  protocol = "TCP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_target_group" "mongooseimintr-5347" {
  name     = "mongooseimintr-5347"
  port     = 5347
  protocol = "TCP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_target_group" "mongooseimintr-8088" {
  name     = "mongooseimintr-8088"
  port     = 8088
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "mongooseimintr-5280" {
  target_group_arn = aws_lb_target_group.mongooseimintr-5280.arn
  target_id        = var.mongooseim01
  port             = 5280
}
resource "aws_lb_target_group_attachment" "mongooseimintr-5347" {
  target_group_arn = aws_lb_target_group.mongooseimintr-5347.arn
  target_id        = var.mongooseim01
  port             = 5347
}
resource "aws_lb_target_group_attachment" "mongooseimintr-8088" {
  target_group_arn = aws_lb_target_group.mongooseimintr-8088.arn
  target_id        = var.mongooseim01
  port             = 8088
}

resource "aws_lb_listener" "mongooseimintr-5280" {
  load_balancer_arn = aws_lb.mongooseimintrnlb.arn
  port              = "5280"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mongooseimintr-5280.arn
  }
}
resource "aws_lb_listener" "mongooseimintr-5347" {
  load_balancer_arn = aws_lb.mongooseimintrnlb.arn
  port              = "5347"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mongooseimintr-5347.arn
  }
}
resource "aws_lb_listener" "mongooseimintr-8088" {
  load_balancer_arn = aws_lb.mongooseimintrnlb.arn
  port              = "8088"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mongooseimintr-8088.arn
  }
}

##############################mongooseim-public################################
resource "aws_lb" "mongooseimpubnlb" {
  name               = "mongooseimpubnlb"
  internal           = false
  load_balancer_type = "network"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection = false
  subnets            = [var.subpub01,var.subpub02]
  tags = {
    Name = "mongooseimpubnlb"
    env = "testort"
  }
}
resource "aws_lb_target_group" "mongooseimpub-tg" {
  name     = "mongooseimpub-tg"
  port     = 5222
  protocol = "TCP"
  vpc_id   = var.vpc_id
stickiness {
    enabled = true
    type = "source_ip"
}
}

resource "aws_lb_target_group_attachment" "mongooseimpub-tgs" {
  target_group_arn = aws_lb_target_group.mongooseimpub-tg.arn
  target_id        = var.mongooseim01
  port             = 5222
}

resource "aws_lb_listener" "mongooseimpub-nlb" {
  load_balancer_arn = aws_lb.mongooseimpubnlb.arn
  port              = "5222"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mongooseimpub-tg.arn
  }
}
#############################################################################
