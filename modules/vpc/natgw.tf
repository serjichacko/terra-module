# NAT GAteway
resource "aws_nat_gateway" "nat-test-ort" {
  allocation_id = aws_eip.pubip.id
  subnet_id     = aws_subnet.test-ort00.id
  depends_on = [aws_internet_gateway.igw-test-ort]

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
}