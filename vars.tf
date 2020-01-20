variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-east-1"
}

variable "environment_tag" {
  description = "Environment tag"
  default = "Production"
}


variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "190.160.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    type = "list"
    default = ["190.160.2.0/24","190.160.4.0/24","190.160.5.0/24"]
}


variable "availability_zone" {
  description = "availability zone to create subnet"
  type ="list"
   default = ["us-east-1b","us-east-1a","us-east-1c"]
}

