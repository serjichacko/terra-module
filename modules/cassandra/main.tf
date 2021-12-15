resource "aws_instance" "cassandra01" {
  ami           = "ami-02922b982706565e6"
  instance_type = "t3a.medium"
  subnet_id = var.subnet
  key_name =  "testort"
  private_ip = "10.101.0.244"
  associate_public_ip_address = false
  vpc_security_group_ids = [var.sshsg, var.cassandrasg]
   root_block_device {
    volume_type = "gp2"
    volume_size = 100
  }
  tags = {
    Name = "cassandra01"
    env = "testort"
    package_cassandra = "cassandra"
  }
}
