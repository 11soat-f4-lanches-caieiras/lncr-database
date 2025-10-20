output "cluster_endpoint" {
  description = "Endpoint do cluster DocumentDB"
  value       = module.documentdb.cluster_endpoint
}

output "cluster_id" {
  description = "ID do cluster DocumentDB"
  value       = module.documentdb.cluster_id
}

output "cluster_arn" {
  description = "ARN do cluster DocumentDB"
  value       = module.documentdb.cluster_arn
}

output "security_group_id" {
  description = "ID do security group do DocumentDB"
  value       = module.documentdb.security_group_id
}

output "master_user_secret_arn" {
  description = "ARN do secret gerado automaticamente para o usuário master"
  value       = module.documentdb.master_user_secret_arn
}