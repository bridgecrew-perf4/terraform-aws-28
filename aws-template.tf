resource "aws_vpc" "vpc" {
  enable_dns_hostnames  = true
  enable_dns_support    = true
  cidr_block            = var.VPCCidr

  tags = {
    Name = "${var.ProjectName}-vpc"
    }
}

resource "aws_internet_gateway" "gw" {
   vpc_id               = aws_vpc.vpc.id

   tags = {
    Name = "${var.ProjectName}-igw"
  }

}