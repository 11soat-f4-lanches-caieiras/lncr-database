data "aws_db_subnet_group" "main" {
  name = "lncr-prd-data-subnet-group"
}

data "aws_security_group" "vpn" {
  name = "lncr-prd-vpn-sg"
}

data "aws_security_group" "eks_node" {
  name = "lncr-nodes-sg"
}