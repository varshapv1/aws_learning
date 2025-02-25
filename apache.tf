module "apache" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"

  name = "${var.env}-apache-server"
  ami  = var.ami_id
  instance_type = "t3a.small"
  
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.security-group.security_group_id]
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  key_name               = "my-key-pair"
  associate_public_ip_address = true

  create_spot_instance = true
  spot_price          = "0.0416"
  spot_type           = "persistent"

  user_data = base64encode(<<-EOF
  #!/bin/bash
  apt update -y
  apt install apache2 -y
  systemctl start apache2
  systemctl enable apache2
  EOF
)

}