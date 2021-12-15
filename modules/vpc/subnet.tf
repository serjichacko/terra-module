#subnet
resource "aws_subnet" "test-ort01" {
  vpc_id     = aws_vpc.testortvpc.id
  cidr_block = var.sub1_cidr_test-ort01
  availability_zone = var.sub_az1_test-ort
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Private01"
  }
}
resource "aws_subnet" "test-ort03" {
  vpc_id     = aws_vpc.testortvpc.id
  cidr_block = var.sub3_cidr_test-ort03
  availability_zone = var.sub_az2_test-ort
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Private02"
  }
}
resource "aws_subnet" "test-ort00" {
  vpc_id     = aws_vpc.testortvpc.id
  cidr_block = var.sub0_cidr_test-ort00
  availability_zone = var.sub_az1_test-ort
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Public01"
  }
}
resource "aws_subnet" "test-ort02" {
  vpc_id     = aws_vpc.testortvpc.id
  cidr_block = var.sub2_cidr_test-ort02
  availability_zone = var.sub_az2_test-ort
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Public02"
  }
}