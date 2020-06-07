resource "random_id" "bucket" {
  byte_length = 8
}


module "bucket" {
  source = "./s3"

  name = "my-bucket-${random_id.bucket.hex}"
}
