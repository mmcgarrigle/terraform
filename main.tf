provider "aws" {
  region                  = var.region
  shared_credentials_file = var.credentials
  }

resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "TFVPC"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "terraform_subnet_a" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance
  key_name      = var.key
}

