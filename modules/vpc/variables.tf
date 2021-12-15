##VPC
variable "vpc_cidr_ort" {
  type        = string
  default = "10.101.0.0/22"
  description = "vpc cidr"
}

##SUBNET
variable "sub0_cidr_test-ort00" {
  type        = string
  default = "10.101.0.0/25"
  description = "sub1 cidr"
}
variable "sub1_cidr_test-ort01" {
  type        = string
  default = "10.101.0.128/25"
  description = "sub2 cidr"
}
variable "sub2_cidr_test-ort02" {
  type        = string
  default = "10.101.1.0/25"
  description = "sub3 cidr"
}
variable "sub3_cidr_test-ort03" {
  type        = string
  default = "10.101.1.128/25"
  description = "sub4 cidr"
}
##AZ##
variable "sub_az1_test-ort" {
  default = "eu-west-1a"
}
variable "sub_az2_test-ort" {
  default = "eu-west-1b"
}

#  modules varaibles:
variable "vpc_id" {
  type   = string

}
variable "adminserver"{
type = string
}
variable "mongooseim01"{
type = string
}

