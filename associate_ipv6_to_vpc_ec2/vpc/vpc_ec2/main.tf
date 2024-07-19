provider "aws" {
   region = var.region_value
}

locals {
  public_subnet_ipv6_prefixes  = [0]
  private_subnet_ipv6_prefixes = [1]
}

resource "aws_vpc" "sample_vpc" {
    cidr_block = var.cidr_block_vpc
    assign_generated_ipv6_cidr_block = true

    
    tags = {
      Name = var.tags_vpc
    }
  
}

resource "aws_subnet" "subnet_1" {
    vpc_id = aws_vpc.sample_vpc.id
    cidr_block = var.cidr_block_subnet_1
    ipv6_cidr_block = cidrsubnet(aws_vpc.sample_vpc.ipv6_cidr_block, 8, local.public_subnet_ipv6_prefixes[0])
    availability_zone = var.availability_zone_subnet_1
   #map_public_ip_on_launch = true

    tags = {
      Name = var.public_subnet_tag
    }
  
}

resource "aws_subnet" "subnet_2" {
    vpc_id = aws_vpc.sample_vpc.id
    cidr_block = var.cidr_block_subnet_2
    ipv6_cidr_block = cidrsubnet(aws_vpc.sample_vpc.ipv6_cidr_block, 8, local.private_subnet_ipv6_prefixes[0])
    availability_zone = var.availability_zone_subnet_2

    tags = {
      Name = var.private_subnet_tag
    }
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.sample_vpc.id

    tags = {
    Name = var.igw
  }
  
}

resource "aws_eip" "eip" {
  domain               = "vpc"
  }


resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.subnet_1.id

  tags = {
    Name = var.nat_gateway
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_egress_only_internet_gateway" "egress_igw" {
    vpc_id = aws_vpc.sample_vpc.id

    tags = {
      Name = var.egress_only_igw
    }
  
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.sample_vpc.id

    route {
        cidr_block = var.cidr_block_igw_route
        gateway_id = aws_internet_gateway.igw.id
    }

    route {

        ipv6_cidr_block = var.ipv6_cidr_block_igw
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
    Name = var.public_route
  }
  
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.sample_vpc.id
    route {
        cidr_block = var.cidr_block_natgw_route
        gateway_id = aws_nat_gateway.NAT.id
    }

    route {
      ipv6_cidr_block = var.ipv6_cidr_block_egress_igw
      gateway_id = aws_egress_only_internet_gateway.egress_igw.id

    }

    tags = {
    Name = var.private_route
  }
  
}

resource "aws_route_table_association" "rta1" {
    subnet_id = aws_subnet.subnet_1.id
    route_table_id = aws_route_table.public.id
  
}

resource "aws_route_table_association" "rta2" {
    subnet_id = aws_subnet.subnet_2.id
    route_table_id = aws_route_table.private.id
  
}

resource "aws_security_group" "sg" {

  vpc_id = aws_vpc.sample_vpc.id

  ingress {
    description = "ssh"
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = var.cidr_block_sg
  } 

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.cidr_block_egress
    ipv6_cidr_blocks = var.ipv6_cidr_block_egress_sg
  }

  tags = {
    name = var.security_group
  }
}

resource "aws_security_group_rule" "allow_all_traffic_for_vpc_endpoints" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  security_group_id = aws_security_group.sg.id
  self = true
}

resource "aws_ec2_instance_connect_endpoint" "vpc_endpoints" {
  subnet_id = aws_subnet.subnet_1.id
  security_group_ids = [aws_security_group.sg.id]

  tags = {

    name = "test_vpc_endpoints"
  }
  
}


resource "aws_instance" "public_ec2" {
    ami = var.public_ami_value
    instance_type = var.public_instance_type_value
    subnet_id = aws_subnet.subnet_1.id
   ipv6_addresses = [cidrhost(aws_subnet.subnet_1.ipv6_cidr_block, 16)]
    vpc_security_group_ids = [aws_security_group.sg.id]
    key_name = var.key_pair_name

    tags = {
    Name = var.public_instance_tag
  }
  
}

resource "aws_instance" "private_ec2" {
    ami = var.private_ami_value
    instance_type = var.public_instance_type_value
    subnet_id = aws_subnet.subnet_2.id
    ipv6_addresses = [cidrhost(aws_subnet.subnet_2.ipv6_cidr_block, 16)]
    vpc_security_group_ids = [aws_security_group.sg.id]
    key_name = var.key_pair_name

    tags = {
    Name = var.private_instance_tag
  }
  
}

# resource "aws_network_interface" "test" {
#   subnet_id       = aws_subnet.subnet_1.id
#   security_groups = [aws_security_group.sg.id]
#   ipv6_addresses = [cidrhost(aws_subnet.subnet_1.ipv6_cidr_block, 16)]
#   source_dest_check = false
#   private_ip = aws_instance.private_ec2.private_ip

#   attachment {
#     instance     = aws_instance.public_ec2.id
#     device_index = 1
#   }
# }








