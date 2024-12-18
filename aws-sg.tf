# creating security group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  dynamic "ingress" {
    for_each = var.ports
    iterator = variablename
    content {
      description = "TLS from VPC"
      from_port   = variablename.value
      to_port     = variablename.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"          //means for any protocol
    cidr_blocks      = ["0.0.0.0/0"] //ipv4 from anywhere
    ipv6_cidr_blocks = ["::/0"]      //ipv6 from anywhere
  }

  tags = {
    Name = "allow_tls"
  }
}
