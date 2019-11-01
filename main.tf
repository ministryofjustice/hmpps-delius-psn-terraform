provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "delius-psn-terraform-state"
    region         = "eu-west-2"
    dynamodb_table = "delius-psn-terraform-state-lock"
    key            = "terraform/terraform.tfstate"
  }
}

resource "aws_s3_bucket" "delius-psn-s3-bucket" {
  bucket = "delius-psn-terraform-state"
  region = "${var.aws_region}"
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "delius-psn-dynamodb-table" {
  hash_key       = "LockID"
  name           = "delius-psn-terraform-state-lock"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
  server_side_encryption {
    enabled = true
  }
}


