# LNCR Database Infrastructure

Repositório responsável pelo provisionamento de todas as instâncias de bancos de dados dos microserviços LNCR.

## Arquitetura

### Bancos de Dados
- **DocumentDB**: lncr-ms-customer (MongoDB compatível)
- **RDS PostgreSQL**: 6 microserviços
  - lncr-ms-oauth
  - lncr-ms-customer-order
  - lncr-ms-payment
  - lncr-ms-food-item
  - lncr-ms-notification
  - lncr-ms-kitchen-order

## Estrutura

```
modules/
├── documentdb/                    # DocumentDB para ms-customer
├── rds-postgresql-oauth/          # RDS para ms-oauth
├── rds-postgresql-customer-order/ # RDS para ms-customer-order
├── rds-postgresql-payment/        # RDS para ms-payment
├── rds-postgresql-food-item/      # RDS para ms-food-item
├── rds-postgresql-notification/   # RDS para ms-notification
└── rds-postgresql-kitchen-order/  # RDS para ms-kitchen-order

.github/workflows/
├── deploy-database.yml            # Deploy DocumentDB
├── deploy-oauth-db.yml           # Deploy OAuth RDS
├── deploy-customer-order-db.yml  # Deploy Customer Order RDS
├── deploy-payment-db.yml         # Deploy Payment RDS
├── deploy-food-item-db.yml       # Deploy Food Item RDS
├── deploy-notification-db.yml    # Deploy Notification RDS
└── deploy-kitchen-order-db.yml   # Deploy Kitchen Order RDS
```

## Deploy

### Deploy Individual
Cada banco possui workflow próprio para deploy manual via GitHub Actions:
- Acesse Actions → Selecione o workflow → Run workflow

### Deploy Completo
```bash
terraform init
terraform plan -var-file="prd.tfvars"
terraform apply -var-file="prd.tfvars"
```

## Configuração

### Variáveis (prd.tfvars)
```hcl
db_username         = "lncrapp"
instance_class      = "db.t4g.medium"  # DocumentDB
rds_instance_class  = "db.t3.micro"    # RDS PostgreSQL
allocated_storage   = 20               # GB
instance_count      = 1
environment         = "prd"
prefix_name         = "lncr"
```

## Recursos Criados

### DocumentDB
- Cluster DocumentDB
- Instâncias do cluster
- Security Group (porta 27017)
- Secrets Manager (credenciais)

### RDS PostgreSQL
- Instância RDS PostgreSQL 15.4
- Storage GP3 criptografado
- Security Group (porta 5432)
- Secrets Manager (credenciais)
- Autoscaling de storage (20GB-100GB)

## Segurança
- Senhas gerenciadas pelo AWS Secrets Manager
- Storage criptografado
- Acesso restrito à VPC (10.1.0.0/16)
- Security Groups específicos por serviço