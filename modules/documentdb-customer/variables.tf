variable "db_username" {
  description = "Username do banco de dados"
  type        = string
}

variable "db_password" {
  description = "Password do banco de dados"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "instance_class" {
  description = "Classe da instância DocumentDB"
  type        = string
}

variable "instance_count" {
  description = "Número de instâncias no cluster"
  type        = number
  default     = 1
}

variable "environment" {
  description = "Ambiente (dev, stg, prod)"
  type        = string
}

variable "prefix_name" {
  description = "Prefixo para nomes dos recursos"
  type        = string
}