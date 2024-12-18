resource "aws_key_pair" "rsa-tf" {
  key_name   = "TF-rsa"
  public_key = file("${path.module}/id_rsa.pub")
}

