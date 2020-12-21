### variables from terraform.tfvars ###

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

### variables for vpc.tf ###
variable "project_name" {
  type            = string 
  description     = "Name for template project"
}

variable "cidr_block" {
  default         = "10.4.0.0/19"
  description     = "CIDR for the VPC"
}
