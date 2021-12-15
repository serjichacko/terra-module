resource "aws_s3_bucket" "comare-ort-bucket" {
  bucket = "comare-ort-bucket"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = {
    Name        = "comare-ort-bucket"
    env = "testort"
  }
}
resource "aws_s3_bucket_public_access_block" "private-s3" {
  bucket = aws_s3_bucket.comare-ort-bucket.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}