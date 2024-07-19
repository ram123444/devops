output "vpc_ipv6_cidr_block" {
    value = data.assign_generated_ipv6_cidr_block.ipv6_cidr_association
  
}
output "public_subnet_ipv6_cidr" {
    value = data.assign_generated_ipv6_cidr_block.ipv6_cidr_association
  
}
output "private_subnet_ipv6_cidr" {
    value = data.assign_generated_ipv6_cidr_block.ipv6_cidr_association
  
}
output "egress_igw_id"{
    value = aws_egress_only_internet_gateway.egress_igw
}
output "aws_vpc_security_group_ingress_rule" {
    value = aws_vpc_security_group_ingress_rule.allow_tls_ipv6
  
}
output "aws_egress_only_internet_gateway" {
    value = aws_vpc_security_group_egress_rule.allow_all_traffic_ipv6
  
}