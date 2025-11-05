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

output "master_user_secret_arn" {
  description = "ARN do secret gerado automaticamente para o usuário master"
  value       = aws_db_instance.main.master_user_secret[0].secret_arn
}