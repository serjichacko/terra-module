variable "vpc_id" {
  type   = string
}
variable "environment" {
  type = any
}
variable "sshsg" {
  type = any
}
variable "subnet" {
  type = string
}
variable "backendsg" {
  type = any
}