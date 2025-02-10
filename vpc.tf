module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "my-ec2-instance"

  ami                    = "ami-0c50b6f7dc3701ddd"  # Replace with a valid AMI ID
  instance_type          = "t2.micro"
  subnet_id             = element(module.vpc.public_subnets, 0)  # Place EC2 in the first public subnet
  vpc_security_group_ids = [module.vpc.default_security_group_id]

  tags = {
    Name        = "my-ec2-instance"
    Terraform   = "true"
    Environment = "dev"
  }
}

