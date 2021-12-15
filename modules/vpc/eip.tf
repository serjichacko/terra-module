#Public IP
resource "aws_eip" "pubip" {
  vpc              = true
}
resource "aws_eip" "admin_eip" {
  vpc = true
  instance = var.adminserver
}
resource "aws_eip" "mongooseim01" {
  vpc              = true
  instance = var.mongooseim01
}
