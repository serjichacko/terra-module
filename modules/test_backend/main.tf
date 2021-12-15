resource "aws_instance" "test_backend01" {
  ami           = "ami-02922b982706565e6"
  instance_type = "t3a.medium"
  subnet_id = var.subnet
  key_name =  "testort"
  private_ip = "10.101.1.212"
  associate_public_ip_address = false
  vpc_security_group_ids = [var.sshsg, var.backendsg]
   root_block_device {
    volume_type = "gp2"
    volume_size = 50
  }
  tags = {
    Name = "test_backend01"
    env = "testort"
    package_nodejs = "nodejs"
    package_nginx = "nginx"
  }
}
