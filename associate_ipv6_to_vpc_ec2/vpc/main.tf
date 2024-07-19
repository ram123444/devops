provider "aws" {
    region = "ap-south-1"
  
}

module "vpc" {
    source = "./vpc_ec2"
    region_value= var.region_value
    cidr_block_vpc = var.cidr_block_vpc
    tags_vpc = var.tags_vpc
    cidr_block_subnet_1 = var.cidr_block_subnet_1
    availability_zone_subnet_1 = var.availability_zone_subnet_1
    public_subnet_tag = var.public_subnet_tag
    cidr_block_subnet_2 = var.cidr_block_subnet_2
    availability_zone_subnet_2 = var.availability_zone_subnet_2
    private_subnet_tag = var.private_subnet_tag
    igw = var.igw
    cidr_block_igw_route = var.cidr_block_igw_route
    ipv6_cidr_block_igw = var.ipv6_cidr_block_igw
    nat_gateway = var.nat_gateway
    egress_only_igw = var.egress_only_igw
    ipv6_cidr_block_egress_igw = var.ipv6_cidr_block_egress_igw
    public_route = var.public_route
    private_route = var.private_route
    cidr_block_natgw_route = var.cidr_block_natgw_route
    cidr_block_sg = var.cidr_block_sg
    security_group = var.security_group
    cidr_block_egress = var.cidr_block_egress
    ipv6_cidr_block_egress_sg = var.ipv6_cidr_block_egress_sg
    public_ami_value = var.public_ami_value
    public_instance_type_value = var.public_instance_type_value
    key_pair_name = var.key_pair_name
    public_instance_tag = var.public_instance_tag
    private_ami_value = var.private_ami_value
    private_instance_type_value = var.private_instance_type_value
    private_instance_tag = var.private_instance_tag

}