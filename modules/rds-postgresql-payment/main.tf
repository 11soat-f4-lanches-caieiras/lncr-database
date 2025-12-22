resource "aws_security_group" "rds_postgresql" {
  name_prefix = "${var.prefix_name}-${var.environment}-payment-rds"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.1.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.prefix_name}-${var.environment}-payment-rds-sg"
    Environment = var.environment
  }
}

resource "aws_db_instance" "main" {
  identifier     = "${var.prefix_name}-${var.environment}-payment-rds"
  engine         = "postgres"
  engine_version = var.engine_version
  instance_class = var.instance_class
  
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = "gp3"
  storage_encrypted     = true
  
  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  
  vpc_security_group_ids = [aws_security_group.rds_postgresql.id]
  db_subnet_group_name   = data.aws_db_subnet_group.main.name
  
  skip_final_snapshot = true
  
  tags = {
    Name        = "${var.prefix_name}-${var.environment}-payment-rds"
    Environment = var.environment
  }
}