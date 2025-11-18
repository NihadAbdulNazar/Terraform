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


resource "aws_instance" "web_server" {
  ami           = "ami-0dee22c13ea7a9a67" # Amazon Linux 2023 (ap-south-1)
  instance_type = "t2.micro"

  tags = {
    Name = "Nihad-EC2"
  }
}
