#security Group
###########################ssh_allow################################
resource "aws_security_group" "ssh_access" {
  name        = "ssh-access"
  description = "Allow SSH inbound traffic"
  vpc_id       = var.vpc_id
  ingress {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
  ingress {
      description      = "SSH from DevOps"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["172.0.0.0/24"]
    }
  ingress {
      description      = "SSH/Jenkins from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["10.0.0.178/32"]
    }
  ingress {
      description      = "Prometheus"
      from_port        = 9090
      to_port          = 9090
      protocol         = "tcp"
      cidr_blocks      = ["10.0.0.178/32"]
    }
  ingress {
      description      = "Prometheus"
      from_port        = 9100
      to_port          = 9100
      protocol         = "tcp"
      cidr_blocks      = ["10.0.0.178/32"]
    }
  ingress {
      description      = "Prometheus-mysql"
      from_port        = 9104
      to_port          = 9104
      protocol         = "tcp"
      cidr_blocks      = ["10.10.0.179/32"]
    }
ingress {
      description      = "Prometheus-es"
      from_port        = 9114
      to_port          = 9114
      protocol         = "tcp"
      cidr_blocks      = ["10.10.0.179/32"]
    }
ingress {
      description      = "Prometheus-redis"
      from_port        = 9121
      to_port          = 9121
      protocol         = "tcp"
      cidr_blocks      = ["10.10.0.179/32"]
    }

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "allow_ssh"
  }
}
#######################ALB###########################
resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Allow elb inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
      description      = "alb from public"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "allow_public_alb"
  }
}
####################cassandra############################
resource "aws_security_group" "cassandra" {
  name        = "cassandra"
  description = "cassandra"
  vpc_id       = var.vpc_id
  ingress {
      description      = "cassandra"
      from_port        = 9042
      to_port          = 9042
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
ingress {
      description      = "cassandra-cluster"
      from_port        = 7000
      to_port          = 7000
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "cassandra"
  }
}

##################elasticsearch##########################
resource "aws_security_group" "elasticsearch" {
  name        = "elasticsearch"
  description = "elasticsearch"
  vpc_id       = var.vpc_id
  ingress {
      description      = "elasticsearch"
      from_port        = 9200
      to_port          = 9200
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "elasticsearch"
  }
}
########################mysql###################
resource "aws_security_group" "mysql" {
  name        = "mysql"
  description = "mysql"
  vpc_id       = var.vpc_id
  ingress {
      description      = "mysql"
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "mysql"
  }
}
######################rabbitmq############################
resource "aws_security_group" "rabbitmq" {
  name        = "rabbitmq"
  description = "rabbitmq"
  vpc_id       = var.vpc_id
  ingress {
      description      = "rabbitmqdate"
      from_port        = 5672
      to_port          = 5672
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
     ingress {
      description      = "rabbitmqmnt"
      from_port        = 15672
      to_port          = 15672
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "rabbitmq"
  }
}
#################redis#####################
resource "aws_security_group" "redis" {
  name        = "redis"
  description = "redis"
  vpc_id       = var.vpc_id
  ingress {
      description      = "redis"
      from_port        = 6379
      to_port          = 6384
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
ingress {
      description      = "redis"
      from_port        = 16379
      to_port          = 16384
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "redis"
  }
}
################mongooseim#########################
resource "aws_security_group" "mongooseim" {
  name        = "mongooseim"
  description = "mongooseim"
  vpc_id       = var.vpc_id
  ingress {
      description      = "mongooseim-pub"
      from_port        = 5222
      to_port          = 5222
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
ingress {
      description      = "mongooseim-8088"
      from_port        = 8088
      to_port          = 8088
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
ingress {
      description      = "mongooseim-5347"
      from_port        = 5347
      to_port          = 5347
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
    ingress {
      description      = "mongooseim-5280"
      from_port        = 5280
      to_port          = 5280
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "mongooseim"
  }
}
#################admin-service##########################
resource "aws_security_group" "admin_service" {
  name        = "admin"
  description = "admin"
  vpc_id       = var.vpc_id
  ingress {
      description      = "admin-data"
      from_port        = 3000
      to_port          = 3000
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
 ingress {
      description      = "admin-https"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "admin"
  }
}
#######################registration######################
resource "aws_security_group" "registration_service" {
  name        = "registration_service"
  description = "registration_service"
  vpc_id       = var.vpc_id
  ingress {
      description      = "registration-data"
      from_port        = 3010
      to_port          = 3010
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
 ingress {
      description      = "registration-http"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "registration"
  }
}
#######################contact-socket######################
resource "aws_security_group" "socket_service" {
  name        = "socket_service"
  description = "socket_service"
  vpc_id       = var.vpc_id
  ingress {
      description      = "socket-data"
      from_port        = 3005
      to_port          = 3005
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
 ingress {
      description      = "socket-http"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "socket"
  }
}
#######################backend-service######################
resource "aws_security_group" "backend_service" {
  name        = "backend_service"
  description = "backend_service"
  vpc_id       = var.vpc_id
  ingress {
      description      = "backend-data"
      from_port        = 3000
      to_port          = 3000
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
 ingress {
      description      = "backend-http"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "backend"
  }
}
#######################logging-service######################
resource "aws_security_group" "logging_service" {
  name        = "logging_service"
  description = "logging_service"
  vpc_id       = var.vpc_id
 ingress {
      description      = "logging-http"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [var.vpccidr]
    }
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "logging_service"
  }
}

