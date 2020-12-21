#### public subnets ###

resource "aws_subnet" "public_1" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.4.0.0/22"
  availability_zone         = data.aws_availability_zones.available.names[0]
  tags                      = {Name = "${var.project_name} public a"}
}

resource "aws_subnet" "public_2" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.4.4.0/22"
  availability_zone         = data.aws_availability_zones.available.names[1]
  tags                      = {Name = "${var.project_name} public b"}
}

resource "aws_subnet" "public_3" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.4.8.0/22"
  availability_zone         = data.aws_availability_zones.available.names[2]
  tags                      = {Name = "${var.project_name} public c"}
}


#### private subnets ###

resource "aws_subnet" "private_1" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.4.12.0/22"
  availability_zone         = data.aws_availability_zones.available.names[0]
  tags                      = {Name = "${var.project_name} private a"}
}

resource "aws_subnet" "private_2" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.4.16.0/22"
  availability_zone         = data.aws_availability_zones.available.names[1]
  tags                      = {Name = "${var.project_name} private b"}
}

resource "aws_subnet" "private_3" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.4.20.0/22"
  availability_zone         = data.aws_availability_zones.available.names[2]
  tags                      = {Name = "${var.project_name} private c"}
}
