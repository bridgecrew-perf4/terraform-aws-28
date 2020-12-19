# variables from terraform.tfvars

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {}

# variable for aws-template.tf

variable "ProjectName" {
  default= "radive15"
}

variable "VPCCidr" {
    default="10.4.0.0/19"
  
}