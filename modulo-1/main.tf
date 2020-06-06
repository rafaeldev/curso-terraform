# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
}

# Create a VPC
# resource "aws_vpc" "example" {
#   cidr_block = "10.0.0.0/16"
# }

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-xpto"
  acl    = "private"

  tags = {
    Name        = "My super bucket"
    Environment = "Test"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = "${aws_s3_bucket.b.id}"
  key    = "hello-new-world.txt"
  source = "world.txt"
  etag = "${filemd5("world.txt")}"
}
