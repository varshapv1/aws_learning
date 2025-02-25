
aws_region = "ap-south-1" 
env = "dev" 
allowed_ip = "122.165.180.53/32"
 ami_id = "ami-00bb6a80f01f03502" 
availability_zones = ["ap-south-1a", "ap-south-1b"]
 private_subnets = ["10.10.3.0/24", "10.10.4.0/24"]
public_subnets  = ["10.10.1.0/24", "10.10.2.0/24"]
cidr = "10.10.0.0/20" 
single_nat_gateway = true