module "documentdb" {
  source = "./modules/documentdb-customer"

  db_username      = var.db_username
  vpc_id           = data.aws_vpc.main.id
  instance_class   = var.instance_class
  instance_count   = var.instance_count
  environment      = var.environment
  prefix_name      = var.prefix_name
}

module "rds_oauth" {
  source = "./modules/rds-postgresql-oauth"

  db_name          = "oauth"
  db_username      = var.db_username
  vpc_id           = data.aws_vpc.main.id
  instance_class   = var.rds_instance_class
  allocated_storage = var.allocated_storage
  environment      = var.environment
  prefix_name      = var.prefix_name
}

module "rds_customer_order" {
  source = "./modules/rds-postgresql-customer-order"

  db_name          = "customerorder"
  db_username      = var.db_username
  vpc_id           = data.aws_vpc.main.id
  instance_class   = var.rds_instance_class
  allocated_storage = var.allocated_storage
  environment      = var.environment
  prefix_name      = var.prefix_name
}

module "rds_payment" {
  source = "./modules/rds-postgresql-payment"

  db_name          = "payment"
  db_username      = var.db_username
  vpc_id           = data.aws_vpc.main.id
  instance_class   = var.rds_instance_class
  allocated_storage = var.allocated_storage
  environment      = var.environment
  prefix_name      = var.prefix_name

}

module "rds_food_item" {
  source = "./modules/rds-postgresql-food-item"

  db_name          = "fooditem"
  db_username      = var.db_username
  vpc_id           = data.aws_vpc.main.id
  instance_class   = var.rds_instance_class
  allocated_storage = var.allocated_storage
  environment      = var.environment
  prefix_name      = var.prefix_name
}

module "rds_notification" {
  source = "./modules/rds-postgresql-notification"

  db_name          = "notification"
  db_username      = var.db_username
  vpc_id           = data.aws_vpc.main.id
  instance_class   = var.rds_instance_class
  allocated_storage = var.allocated_storage
  environment      = var.environment
  prefix_name      = var.prefix_name
}

module "rds_kitchen_order" {
  source = "./modules/rds-postgresql-kitchen-order"

  db_name          = "kitchenorder"
  db_username      = var.db_username
  vpc_id           = data.aws_vpc.main.id
  instance_class   = var.rds_instance_class
  allocated_storage = var.allocated_storage
  environment      = var.environment
  prefix_name      = var.prefix_name
}