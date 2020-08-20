provider "aws" {
  region                  = var.region
  shared_credentials_file = var.credentials
}

resource "aws_vpc" "terraform_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "TFVPC"
  }
}

resource "aws_security_group" "Allow_SSH" {
  name        = "Allow_SSH"
  description = "Allows ability to SSH into EC2 instance"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
      cidr_blocks = [var.internet]
    }
  }

  egress {
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
    cidr_blocks = [var.internet]
  }

  tags = {
    Name = "Allow_SSH"
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
    cidr_block = var.internet
    gateway_id = var.TFGW
  }

  tags = {
    Name = "RT for terraform_vpc"
  }
}

resource "aws_route_table_association" "TFRT_association" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.TFRT.id
}

resource "aws_instance" "web" {
  ami                         = var.ami
  instance_type               = var.instance
  key_name                    = var.key
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.Allow_SSH.id]

  tags = {
    Name = "TFEC2"
  }
}