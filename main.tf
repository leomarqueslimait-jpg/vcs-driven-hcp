terraform {

cloud {
    organization = "leomarqueslima"
    workspaces {
        name = "terraform-aws-simplevpc-module"
    }
}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "simple_vpc" {
  source  = "app.terraform.io/leomarqueslima/simple_vpc/aws"
  version = "1.0.3"

  az = "us-east-1a"
  name = "vcs-drive-architecture"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}
