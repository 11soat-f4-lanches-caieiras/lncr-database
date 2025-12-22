data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["lncr-prd-vpc"]
  }
}

data "aws_db_subnet_group" "main" {
  name = "lncr-prd-data-subnet-group"
}