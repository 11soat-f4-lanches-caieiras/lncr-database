module "documentdb" {
  source = "./modules/documentdb"

  db_username      = var.db_username
  vpc_id           = data.aws_vpc.main.id
  instance_class   = var.instance_class
  instance_count   = var.instance_count
  environment      = var.environment
  prefix_name      = var.prefix_name
}