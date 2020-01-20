
# VPC

resource "aws_vpc" "test_tf_vpc" {
    cidr_block = "${var.vpc_cidr}"
    instance_tenancy = "default"
    enable_dns_support   = true
    enable_dns_hostnames = true    
    tags = {
        Name = "terraform-aws-vpc"
    }
}

# Internet Gateway
resource "aws_internet_gateway" "test_igw" {
vpc_id = "${aws_vpc.test_tf_vpc.id}"
  tags = {
    Name = "TFmain-IGW"
  }
}


/*
  Public Subnet
*/

resource "aws_subnet" "test_public-subnets" {
    count = "${length(var.availability_zone)}"
    vpc_id = "${aws_vpc.test_tf_vpc.id}"
    cidr_block = "${element(var.public_subnet_cidr,count.index)}"
    availability_zone = "${element(var.availability_zone,count.index)}"


    tags = {
        Name = "Public Subnet-${count.index+1}"
    }
}

# Route Table: Attach Internet Gateway
resource "aws_route_table" "test_tf_route" {
vpc_id ="${aws_vpc.test_tf_vpc.id}"
route {
	cidr_block ="0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.test_igw.id}"
      }
route {
    ipv6_cidr_block= "::/0"
    gateway_id = "${aws_internet_gateway.test_igw.id}"  
     }

tags = {
  Name = "TFPublicRouteTable"
}
}

#Route table association with public subnets
resource "aws_route_table_association" "test_rta" {
	count = "${length(var.availability_zone)}"
	subnet_id = "${element(aws_subnet.test_public-subnets.*.id,count.index)}"
	route_table_id = "${aws_route_table.test_tf_route.id}"
}

