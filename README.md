# My AWS Learning Journey

I learned how to create an **EC2 instance** and an **S3 bucket** in AWS using Terraform. Below are brief explanations of each service and the steps I followed to create them.

## What is EC2 (Elastic Compute Cloud)?

EC2 (Elastic Compute Cloud) is a web service provided by AWS that allows you to rent virtual servers, known as **instances**. You can run applications, store data, and configure various services on these servers. EC2 is highly scalable, meaning you can increase or decrease computing power based on your needs.

### EC2 Features:
- **Elasticity**: Scale up or down easily.
- **Security**: Control access with security groups and key pairs.
- **Cost-Effective**: Pay only for the resources you use.

---

## What is S3 (Simple Storage Service)?

S3 is a storage service provided by AWS that allows you to store and retrieve data in the cloud. It's designed to be highly durable, available, and scalable, making it a popular choice for storing backups, media files, and other data.

### S3 Features:
- **Scalability**: Store virtually unlimited amounts of data.
- **Durability**: 99.999999999% durability for your data.
- **Access Control**: Fine-grained control over who can access your data.

---

## How I Created EC2 and S3 Using Terraform

### 1. Create EC2 Instance and s3 bucket Using Terraform

The following Terraform configuration was used to create an EC2 instance in AWS:

```hcl
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
```
## Initialize Terraform: 

Run the following command in terminal to initialize your Terraform configuration:

```hcl
terraform init
```
```hcl
terraform plan
```
```hcl
terraform apply
```



