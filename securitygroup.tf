# security group for public subnet

resource "aws_security_group" "sg_public" {
    name                    = "${var.project_name} public access"
    vpc_id                  = aws_vpc.main.id
    
    ingress {
    description             = "allow https from public"
    from_port               = 443
    to_port                 = 443
    protocol                = "tcp"
    cidr_blocks             = ["0.0.0.0/0"]
  }
    ingress {
    description             = "allow http from public"
    from_port               = 80
    to_port                 = 80
    protocol                = "tcp"
    cidr_blocks             = ["0.0.0.0/0"]
  }
    ingress {
    description             = "allow ssh from public"
    from_port               = 22
    to_port                 = 22
    protocol                = "tcp"
    cidr_blocks             = ["0.0.0.0/0"]
  }
    egress {
    from_port               = 0
    to_port                 = 0
    protocol                = "-1"
    cidr_blocks             = ["0.0.0.0/0"]
  }

}

# security group for private subnet

resource "aws_security_group" "sg_private" {
    name                    = "${var.project_name} private access"
    vpc_id                  = aws_vpc.main.id

    egress {
    from_port               = 0
    to_port                 = 0
    protocol                = "-1"
    cidr_blocks             = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "sg_private" {
    type                    = "ingress"
    from_port               = 0
    to_port                 = 65535
    protocol                = "tcp"
    security_group_id       = aws_security_group.sg_private.id
    source_security_group_id= aws_security_group.sg_public.id

}