# Create the VPC

resource "aws_vpc" "main" {
  enable_dns_hostnames      = true
  enable_dns_support        = true
  cidr_block                = var.cidr_block
  tags                      = { Name = "${var.project_name} vpc" }
}

# VPC internet access for public subnets

resource "aws_internet_gateway" "igw" {
  vpc_id                    = aws_vpc.main.id
  tags                      = { Name = "${var.project_name} igw" }
}

# VPC internet access for private subnets

resource "aws_eip" "eip" {
  vpc                       = true
  tags                      = { Name = "${var.project_name} nat ip" }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id             = aws_eip.eip.id
  subnet_id                 = aws_subnet.public_1.id 
  depends_on                =[aws_eip.eip]
  tags                      = { Name = "${var.project_name} nat gw" }
}

## set up routing table for public subnets


resource "aws_route_table" "route_table_public" {
  vpc_id                    = aws_vpc.main.id
  tags                      = { Name = "${var.project_name} public route table" }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "route_table_association_public1" {
  route_table_id            = aws_route_table.route_table_public.id
  subnet_id                 = aws_subnet.public_1.id
  
}

resource "aws_route_table_association" "route_table_association_public2" {
  route_table_id            = aws_route_table.route_table_public.id
  subnet_id                 = aws_subnet.public_2.id
  
}

resource "aws_route_table_association" "route_table_association_public3" {
  route_table_id            = aws_route_table.route_table_public.id
  subnet_id                 = aws_subnet.public_3.id
  
}

## set up routing table for private subnets

resource "aws_route_table" "route_table_private" {
  vpc_id                    = aws_vpc.main.id
  tags                      = { Name = "${var.project_name} private route table" }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }
}

resource "aws_route_table_association" "route_table_association_private1" {
  route_table_id            = aws_route_table.route_table_private.id
  subnet_id                 = aws_subnet.private_1.id
  
}

resource "aws_route_table_association" "route_table_association_private2" {
  route_table_id            = aws_route_table.route_table_private.id
  subnet_id                 = aws_subnet.private_2.id
  
}

resource "aws_route_table_association" "route_table_association_private3" {
  route_table_id            = aws_route_table.route_table_private.id
  subnet_id                 = aws_subnet.private_3.id
  
}











































