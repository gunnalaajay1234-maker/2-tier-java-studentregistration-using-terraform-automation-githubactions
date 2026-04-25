resource "aws_instance" "app" {
  ami                    = "ami-05d2d839d4f73aafb"
  instance_type          = "t3.small"
  subnet_id              = aws_subnet.app_subnet.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  key_name               = "AJAYKEY"

  user_data = templatefile("${path.module}/user_data.sh", {
    db_host     = aws_db_instance.db.address
    db_name     = var.db_name
    db_user     = var.db_user
    db_password = var.db_password
  })

  tags = {
    Name = var.ec2_name
  }
}