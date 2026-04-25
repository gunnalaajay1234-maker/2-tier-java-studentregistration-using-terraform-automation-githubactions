terraform {
  backend "s3" {
    bucket  = "ajay-terraform-state-bucket-123"
    key     = "2tier/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}