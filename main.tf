resource "aws_s3_bucket" "tf_state" {
  bucket = "nihad-terraform-state"
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-locks"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}
