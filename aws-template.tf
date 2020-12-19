resource "aws_vpc" "test" {
  enable_dns_hostnames  = true
  enable_dns_support    = true
  cidr_block            = var.VPCCidr

  tags = {
    Name = "${var.project_name}-vpc"
    }

}