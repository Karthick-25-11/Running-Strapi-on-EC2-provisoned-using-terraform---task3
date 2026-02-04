resource "aws_instance" "this" {
  ami           = "ami-0532be01f26a3de55"
  instance_type = "t3.micro"
  key_name      = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y nodejs npm
    npm install -g yarn
  EOF

  tags = {
    Name = "Strapi-EC2"
  }
}
