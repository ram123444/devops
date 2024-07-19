variable "region_value" {
    description = "value of region"
  
}

variable "cidr_block_vpc" {
    description = "value of vpc cidr block"
  
}

variable "tags_vpc" {
    description = "value of vpc tags"  
}



variable "cidr_block_subnet_1" {
    description = "value of public subnet cidr block"
  
}


variable "availability_zone_subnet_1" {
    description = "value of public subnet availability zone"  
}

variable "public_subnet_tag" {
    description = "value of public subnet"  
}

variable "cidr_block_subnet_2" {

    description = "value of private subnet cidr block"
  
}

variable "availability_zone_subnet_2" {
    description = "value of private subnet availability zone"
  
}

variable "private_subnet_tag" {
    description = "value of private subnet"  
}

variable "igw" {
     description = "value of igw"
}

variable "cidr_block_igw_route" {
   description = "value of igw route table cidr block"
  
}

variable "ipv6_cidr_block_igw" {
    description = "value of igw ipv6 route cidr block"
  
}



variable "cidr_block_natgw_route" {
    description = "value of nat gw route cidr block"
  
}

variable "nat_gateway" {
     description = "value of natgw"
}

variable "ipv6_cidr_block_egress_igw" {
    description = "value of egress igw route cidr block"
  
}

variable "egress_only_igw" {
     description = "value of egress_only_igw"
}

variable "public_route" {
  description = "value of public route"
}

variable "private_route" {
  description = "value of private route"
}

variable "cidr_block_sg" {
    description = "value of sg cidr block"
  
}

variable "cidr_block_egress" {
    description = "value of egress cidr block"
  
}

variable "ipv6_cidr_block_egress_sg" {
    description = "value of egress sg cidr block"
  
}

variable "security_group" {
  description = "value of security group"
}

variable "public_ami_value" {
    description = "value of ami"
  
}

variable "public_instance_type_value" {
    description = "value of instance value"
  
}

variable "key_pair_name" {
    description = "value of key name"

  
}

variable "public_instance_tag" {
  description = "value public_instance_tag"
}

variable "private_ami_value" {
    description = "value of ami"
  
}

variable "private_instance_type_value" {
    description = "value of instance value"
  
}


variable "private_instance_tag" {
  description = "value public_instance_tag"
}