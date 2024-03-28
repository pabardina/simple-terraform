variable "aws_region" {
  type        = string
  description = "The identifier of the region where the infrastructure resides"
  default     = "us-east-1"
}

variable "bucket_name" {
  type        = string
  default     = "useast-1-pab-test-terraform"
  description = "Name of the s3 bucket"
}