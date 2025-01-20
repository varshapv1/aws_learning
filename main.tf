resource "aws_instance" "my_ec2" {
  ami           = "ami-0df8c184d5f6ae949"
  instance_type = "t2.micro"
  tags = {
    Name = "MyEC2Instance"
  }
}

resource "aws_s3_bucket" "my_testbucket123" {
  bucket = "my-test-bucket123-unique"
  provider = aws
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

