# terraform for AWS

please create **terraform.tfvars** file for access to AWS

```sh
aws_access_key = ""
aws_secret_key = ""
aws_region     = ""
```

## About the Repository
This stack consists of:

- 1 VPC
- 3 public subnets
- 3 private subnets
- 1 internet gateway for public subnets
- 1 NAT gateway for private subnets
- 1 EIP for NAT gateway
- 2 security group for public subnets and private subnets