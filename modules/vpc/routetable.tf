#Route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.testortvpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw-test-ort.id
    }

  tags = {
    Name = "public"
  }
}
resource "aws_route_table_association" "pub01_an" {
  subnet_id      = aws_subnet.test-ort00.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "pub02_an" {
  subnet_id      = aws_subnet.test-ort02.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.testortvpc.id

  route{
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.nat-test-ort.id
    }

  tags = {
    Name = "private"
  }
}
resource "aws_route_table_association" "private01_an" {
  subnet_id      = aws_subnet.test-ort01.id
  route_table_id = aws_route_table.private.id
  }
  resource "aws_route_table_association" "private02_an" {
  subnet_id      = aws_subnet.test-ort03.id
  route_table_id = aws_route_table.private.id
  }