resource "aws_instance" "push_service01" {
  ami           = "ami-02922b982706565e6"
  instance_type = "t3a.small"
  subnet_id = var.subnet
  key_name =  "testort"
  private_ip = "10.101.1.201"
  associate_public_ip_address = false
  vpc_security_group_ids = [var.sshsg]
   root_block_device {
    volume_type = "gp2"
    volume_size = 50
  }
  tags = {
    Name = "push_service01"
    env = "testort"
    package_java = "java"
    package_maven = "maven"
  }
}
