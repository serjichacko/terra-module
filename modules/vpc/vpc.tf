# VPC #
resource "aws_vpc" "testortvpc" {
  cidr_block = var.vpc_cidr_ort
   tags = {
    Name = "VPC-test-ORT"
  }
}

 #resource "aws_vpn_gateway" "test-ort-vgw" {
  #  vpc_id = aws_vpc.testortvpc.id
  #}
  
  #resource "aws_customer_gateway" "test-ort-cgw" {
  #  bgp_asn    = 65000
  #  ip_address = "151.253.27.190"
  #  type       = "ipsec.1"
  #}
  
  #resource "aws_vpn_connection" "test-ort-s2s" {
  # vpn_gateway_id      = aws_vpn_gateway.test-ort-vgw.id
  #  customer_gateway_id = aws_customer_gateway.test-ort-cgw.id
  #  type                = "ipsec.1"
  #  static_routes_only  = true
  #}