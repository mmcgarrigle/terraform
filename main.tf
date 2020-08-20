provider "aws" {
  region                  = var.region
  shared_credentials_file = var.credentials
}

module "mmcga_vpc" {
  source = "./VPC"
}

module "mmcga_instance" {
  source = "./EC2"
}

