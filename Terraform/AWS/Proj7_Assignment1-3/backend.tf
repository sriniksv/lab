terraform {
  backend "s3" {
    bucket         = "srini-ksv-tfstate"
    key            = "global/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}