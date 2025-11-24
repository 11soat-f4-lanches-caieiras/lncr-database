variable "db_name" {
  description = "Nome do banco de dados"
  type        = string
}

variable "db_username" {
  description = "Username do banco de dados"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "instance_class" {
  description = "Classe da instância RDS"
  type        = string
}

variable "allocated_storage" {
  description = "Storage alocado em GB"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Storage máximo para autoscaling em GB"
  type        = number
  default     = 100
}

variable "engine_version" {
  description = "Versão do PostgreSQL"
  type        = string
  default     = "15"
}

variable "environment" {
  description = "Ambiente (dev, stg, prod)"
  type        = string
}

variable "prefix_name" {
  description = "Prefixo para nomes dos recursos"
  type        = string
}