module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~>5.19.0"

  name = "${var.env}-vpc"
  cidr = var.cidr

  azs             = var.availability_zones
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

 # enable_nat_gateway     = true
  single_nat_gateway     = true
  #enable_dns_hostnames   = true
  #map_public_ip_on_launch = true
}



