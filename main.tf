provider "aws" {
  region                  = var.region
  shared_credentials_file = var.credentials
}

module "mmcga_vpc" {
  source = "./VPC"
}

module "mmcga_SG" {
  source = "./SG"
  vpc_id = module.mmcga_vpc.vpc_id
}

module "mmcga_instance" {
  source    = "./EC2"
  subnet_id = module.mmcga_vpc.subnet_a_id
  sg_id     = module.mmcga_SG.sg_id
}

