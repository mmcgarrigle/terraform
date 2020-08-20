resource "aws_vpc" "terraform_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "TFVPC"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "terraform_subnet_a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Subnet_a"
  }
}

resource "aws_internet_gateway" "TFGW" {
  vpc_id = var.vpc_id

  tags = {
    Name = "TFGW"
  }
}

resource "aws_route_table" "TFRT" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.Internet
    gateway_id = var.TFGW
  }

  tags = {
    Name = "RT for terraform_vpc"
  }
}

resource "aws_route_table_association" "TFRT_association" {
  subnet_id      = var.subnet_id
  route_table_id = var.TFRT
}