output "vpc_id" {
    value = aws_vpc.sample_vpc.id
  
}

output "public_subnet_id" {
    value = aws_subnet.subnet_1.id
  
}

output "private_subnet_id" {
    value = aws_subnet.subnet_2.id
  
}

output "igw_id" {
    value = aws_internet_gateway.igw.id   
}

output "eip_address" {
   value =   aws_eip.eip.id
}

output "nat_gatway_id" {
    value = aws_nat_gateway.NAT.id
  
}

output "egress_igw" {
    value = aws_egress_only_internet_gateway.egress_igw.id
  
}



