# Create VPC

resource "aws_vpc" "main" {
  enable_dns_hostnames      = true
  enable_dns_support        = true
  cidr_block                = var.cidr_block
  tags                      = { Name = "${var.project_name}-vpc" }
}

# VPC internet access for public subnets

resource "aws_internet_gateway" "igw" {
  vpc_id                    = aws_vpc.main.id
  tags                      = { Name = "${var.project_name}-igw" }
}




















































