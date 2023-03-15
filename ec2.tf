resource "aws_instance" "http_server_1" {
  ami           = "ami-0c94855ba95c71c99" # RHEL 8
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_1.id
  vpc_security_group_ids = [aws_security_group.http_sg.id]
  private_ip    = "10.0.1.10" 
  user_data = file("install-httpd.sh")
  tags = {
    Name = "http_server_1"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "ftp_server_2" {
  ami           = "ami-0c94855ba95c71c99" # RHEL 8
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_2.id
  vpc_security_group_ids = [aws_security_group.ftp_sg.id]
  private_ip = "10.0.2.10"
  user_data = file("install-vsfrpd.sh") 

    tags = {
    Name = "ftp_server_2"
    }

    lifecycle {
    create_before_destroy = true
  }
}