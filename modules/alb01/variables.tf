variable "vpc_id" {
  type   = string
}
variable "environment" {
  type = any
}
variable "alb_sg" {
  type = any
}
variable "subnet01" {
  type = string
}
variable "subnet02" {
  type = string
}
variable "backend01" {
  type = string
}
variable "contact_socket" {
  type = string
}
variable "logging_sevice" {
  type = string
}
variable "registration" {
  type = string
}
