output "sshsg" {
  value = aws_security_group.ssh_access.id
}

output "albpublicsg" {
  value = aws_security_group.alb_sg.id
}
output "elasticsearch" {
  value = aws_security_group.elasticsearch.id
}
output "mysql" {
  value = aws_security_group.mysql.id
}
output "cassandra" {
  value = aws_security_group.cassandra.id
}
output "mongooseim" {
  value = aws_security_group.mongooseim.id
}
output "rabbitmq" {
  value = aws_security_group.rabbitmq.id
}
output "redis" {
  value = aws_security_group.redis.id
}
output "backend" {
  value = aws_security_group.backend_service.id
}
output "admin" {
  value = aws_security_group.admin_service.id
}
output "socket" {
  value = aws_security_group.socket_service.id
}
output "logging" {
  value = aws_security_group.logging_service.id
}
output "registration" {
  value = aws_security_group.registration_service.id
}
