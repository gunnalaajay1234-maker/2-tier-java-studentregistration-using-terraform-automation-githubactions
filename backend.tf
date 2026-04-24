terraform {
  backend "s3" {
    bucket  = "ajay-terraform-state-bucket"
    key     = "2tier/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}