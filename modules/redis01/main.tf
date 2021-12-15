resource "aws_instance" "redis001" {
  ami           = "ami-09a7e44a15d8df302"
  instance_type = "t3a.small"
  subnet_id = var.subnet
  key_name =  "testort"
  private_ip = "10.101.0.180"
  associate_public_ip_address = false
  vpc_security_group_ids = [var.sshsg, var.redissg]
   root_block_device {
    volume_type = "gp2"
    volume_size = 50
  }
  tags = {
    Name = "redis01"
    env = "testort"
    package_redis = "redis"
  }
}



