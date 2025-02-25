variable "aws_region" {
  description = ""
  type        = string
}

variable "env" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "allowed_ip" {
  description = "iP address allowed to access resources"
  type        = string
  default = ""
}

variable "ami_id" {
  description = "Image id for EC2"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "cidr" {
  description = "CIDR blocks for private subnets"
  type        = string
}
variable "single_nat_gateway" {
  description = "Enable single NAT Gateway"
  type        = bool
}
