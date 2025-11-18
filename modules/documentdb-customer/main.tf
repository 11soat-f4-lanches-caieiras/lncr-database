resource "aws_security_group" "documentdb" {
  name_prefix = "${var.prefix_name}-${var.environment}-documentdb"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["10.1.0.0/16"]
  }

  ingress {
    from_port       = 27017
    to_port         = 27017
    protocol        = "tcp"
    security_groups = [data.aws_security_group.vpn.id]
  }

  ingress {
    from_port       = 27017
    to_port         = 27017
    protocol        = "tcp"
    security_groups = [data.aws_security_group.eks_node.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.prefix_name}-${var.environment}-documentdb-sg"
    Environment = var.environment
  }
}

resource "aws_docdb_cluster" "main" {
  cluster_identifier      = "${var.prefix_name}-${var.environment}-documentdb"
  engine                  = "docdb"
  master_username         = var.db_username
  master_password         = var.db_password
  
  vpc_security_group_ids = [aws_security_group.documentdb.id]
  db_subnet_group_name   = data.aws_db_subnet_group.main.name
  
  skip_final_snapshot = true
  
  tags = {
    Name        = "${var.prefix_name}-${var.environment}-documentdb"
    Environment = var.environment
  }
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = var.instance_count
  identifier         = "${var.prefix_name}-${var.environment}-documentdb-${count.index}"
  cluster_identifier = aws_docdb_cluster.main.id
  instance_class     = var.instance_class
  
  tags = {
    Name        = "${var.prefix_name}-${var.environment}-documentdb-${count.index}"
    Environment = var.environment
  }
}