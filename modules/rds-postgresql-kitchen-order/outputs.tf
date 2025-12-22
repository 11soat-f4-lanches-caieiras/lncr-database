output "db_endpoint" {
  description = "Endpoint da instância RDS"
  value       = aws_db_instance.main.endpoint
}

output "db_id" {
  description = "ID da instância RDS"
  value       = aws_db_instance.main.id
}

output "db_arn" {
  description = "ARN da instância RDS"
  value       = aws_db_instance.main.arn
}

output "security_group_id" {
  description = "ID do security group do RDS"
  value       = aws_security_group.rds_postgresql.id
}