resource "aws_instance" "mongooseim01" {
  ami           = "ami-02922b982706565e6"
  instance_type = "t3a.medium"
  subnet_id = var.subnet
  key_name =  "testort"
  private_ip = "10.101.1.103"
  #associate_public_ip_address = false
  vpc_security_group_ids = [var.sshsg, var.mongooseimsg]
   root_block_device {
    volume_type = "gp2"
    volume_size = 100
  }
  tags = {
    Name = "mongooseim01"
    env = "testort"
  }
}
