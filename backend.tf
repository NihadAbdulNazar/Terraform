terraform {
  backend "s3" {
    bucket         = "nihad-terraform-state"
    key            = "global/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
