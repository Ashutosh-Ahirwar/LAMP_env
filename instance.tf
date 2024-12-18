

resource "aws_instance" "Test" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.rsa-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "First_TF_instance" //name of the instance
  }
  user_data = file("${path.module}/script.sh")
}
