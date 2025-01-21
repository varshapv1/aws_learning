
# EC2 Instance
resource "aws_instance" "web_server" {
  ami           = "ami-0e731c8a588258d0d"  # Amazon Linux 2023 AMI (us-east-1)
  instance_type = "t2.micro"
  
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name              = "aws"  # Change to your key pair name

  tags = {
    Name = "web-server"
  }

  user_data = <<-EOF
              #!/bin/bash
              # Update system
              dnf update -y
              
              # Install Java
              dnf install java-17-amazon-corretto -y
              
              # Install Jenkins
              wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
              rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
              dnf upgrade -y
              dnf install jenkins -y --nogpgcheck
              
              # Start Jenkins
              systemctl daemon-reload
              systemctl start jenkins
              systemctl enable jenkins
              
              # Install Git and Apache
              dnf install git httpd -y
              
              # Start Apache
              systemctl start httpd
              systemctl enable httpd
              
              # Set permissions
              usermod -a -G apache jenkins
              chown -R jenkins:apache /var/www/html
              chmod 2775 /var/www/html
              EOF
}

# Output values
output "public_ip" {
  value = aws_instance.web_server.public_ip
}

output "jenkins_url" {
  value = "http://${aws_instance.web_server.public_ip}:8080"
}
