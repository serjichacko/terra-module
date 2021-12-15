#INTERNET gateway ##
resource "aws_internet_gateway" "igw-test-ort" {
  vpc_id = aws_vpc.testortvpc.id

  tags = {
    Name = "main"
  }
}