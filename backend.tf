terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.87.0"
    }
  }
 backend "s3" {
	bucket     	= "mybucketsystem123"
	key        	= "state/terraform.tfstate"
	region     	= "ap-south-1"
	encrypt    	= true
}
}
