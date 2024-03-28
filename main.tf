terraform {
  required_version = "1.5.5"

  backend "s3" {
    bucket = "karen-test-bucket-2024"
    key    = "env.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      "app"       = "test"
      "owner"     = "devops"
      "createdBy" = "terraform"
    }
  }

}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}
