resource "aws_s3_bucket" "example" {
  bucket = "mytftestbucket3002"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}