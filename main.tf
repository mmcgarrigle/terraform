provider "aws" {
  region                  = var.region
  shared_credentials_file = var.credentials
  }

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance
  key_name      = var.key
}

