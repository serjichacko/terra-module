output "testortvpcid" {
  value = aws_vpc.testortvpc.id
}

output "test_ort_pub_sub1a" {
  value = aws_subnet.test-ort00.id
}

output "test_ort_pub_sub1b" {
  value = aws_subnet.test-ort02.id
}

output "test_ort_prv_sub1a" {
  value = aws_subnet.test-ort01.id
}

output "test_ort_prv_sub1b" {
  value = aws_subnet.test-ort03.id
}
output "vpc_cidr" {
  value = aws_vpc.testortvpc.cidr_block
}

output "admin_eip" {
value = aws_eip.admin_eip.id
}

output "mongooseim_eip" {
value = aws_eip.mongooseim01.id
}

