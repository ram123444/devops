
provider "aws" {
    region = "ap-south-1"
  
}

data "aws_vpc" "associate_ipv6" {
    id = var.vpc_id_value
}

resource "assign_generated_ipv6_cidr_block" "ipv6_cidr_association" {
  #provider = aws.ap-south-1
  vpc_id   = data.aws_vpc.associate-ipv6.id
  assign_generated_ipv6_cidr_block = true
  #ipv6_cidr_block = "Amazon-provided"
  
}

data "aws_subnet" "public-subnet" {
    vpc_id = var.vpc_id_value
    id = var.public_subnet_id
}

resource "aws_subnet_ipv6_cidr_block_association" "public_subnet_ipv6_cidr" {
   subnet_id       = data.aws_subnet.Public-subnet.id
   ipv6_cidr_block = data.assign_generated_ipv6_cidr_block.ipv6_cidr_association.ipv6_cidr_block
}

data "aws_subnet" "private_subnet" {
    vpc_id = var.vpc_id_value
    id = var.private_subnet_id
  
}

resource "aws_subnet_ipv6_cidr_block_association" "private_subnet_ipv6_cidr" {
    subnet_id = data.aws_subnet.Private_subnet.id
    ipv6_cidr_block = data.aassign_generated_ipv6_cidr_block.ipv6_cidr_association.ipv6_cidr_block
  
}

data "aws_route_table" "public_route_table" {
  subnet_id = var.public_subnet_id
  route_table_id = var.public_route_table_id
}
data "aws_internet_gateway" "igw" {
  internet_gateway_id = var.igw_id
}

resource "aws_route" "public_subnet_route" {
   route_table_id         = data.aws_subnet.Public_subnet.route_table_id
   destination_ipv6_cidr_block = "::/0"
   gateway_id             = data.aws_internet_gateway.igw
}

data "aws_route_table" "private_subnet_route" {
  subnet_id = var.private_subnet_id
  route_table_id = var.private_route_table_id
}

resource "aws_egress_only_internet_gateway" "egress_igw" {
  vpc_id = data.aws_vpc.associate_ipv6.id
}

resource "aws_route" "private_subnet_route" {
  route_table_id         = data.aws_subnet.Private_subnet.route_table_id
  destination_ipv6_cidr_block = "::/0"
  egress_only_gateway_id = data.aws_egress_only_internet_gateway.egress_igw.id
}

data "aws_security_group" "associate-ipv6-sg" {
  id = var.security_group_id
}
resource "aws_subnet" "public-subnet" {
  vpc_id     = data.aws_security_group.associate-ipv6-sg.vpc_id
}

resource "aws_subnet" "private_subnet-subnet" {
  vpc_id     = data.aws_security_group.associate-ipv6-sg.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
  security_group_id = data.aws_security_group.associate-ipv6-sg.id
  cidr_ipv6         = data.aws_vpc.associate_ipv6.ipv6_cidr_block
  from_port         = 80
  ip_protocol       = "HTTP"
  to_port           = 80
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = data.aws_security_group.associate-ipv6-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" 
}

data "aws_instance" "ipv6-migration-public-ec2instance" {
  instance_id = var.instance_id
}
resource "aws_instance" "ipv6-migration-public-ec2instance" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  ipv6_address_count = 1
  vpc_security_group_ids = ["${aws_security_group.associate-ipv6-sg.id}"]
}












