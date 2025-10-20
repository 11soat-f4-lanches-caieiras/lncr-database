output "cluster_endpoint" {
  description = "Endpoint do cluster DocumentDB"
  value       = aws_docdb_cluster.main.endpoint
}

output "cluster_id" {
  description = "ID do cluster DocumentDB"
  value       = aws_docdb_cluster.main.id
}

output "cluster_arn" {
  description = "ARN do cluster DocumentDB"
  value       = aws_docdb_cluster.main.arn
}

output "security_group_id" {
  description = "ID do security group do DocumentDB"
  value       = aws_security_group.documentdb.id
}

output "master_user_secret_arn" {
  description = "ARN do secret gerado automaticamente para o usuário master"
  value       = aws_docdb_cluster.main.master_user_secret[0].secret_arn
}