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
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Subnet_a"
  }
}

resource "aws_internet_gateway" "TFGW" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "TFGW"
  }
}

resource "aws_route_table" "TFRT" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = var.Internet
    gateway_id = aws_internet_gateway.TFGW.id
  }

  tags = {
    Name = "RT for terraform_vpc"
  }
}

resource "aws_route_table_association" "TFRT_association" {
  subnet_id      = aws_subnet.terraform_subnet_a.id
  route_table_id = aws_route_table.TFRT.id
}