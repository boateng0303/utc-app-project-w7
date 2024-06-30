resource "aws_instance" "server1" {
  ami             = "ami-0195204d5dce06d99"
  instance_type   = "t2.micro"
  subnet_id = aws_subnet.public1.id
  #security_groups = [aws_security_group.sg-demo.id]
  vpc_security_group_ids = [aws_security_group.sg-demo.id]
  key_name        = aws_key_pair.aws_key.key_name
  user_data       = file("server.sh")
  tags = {
    Name = "utc-app-inst"
  }

  depends_on = [ aws_vpc.vp1 ]
}




/*resource "aws_ebs_volume" "volume1" {
  availability_zone = aws_instance.server1.availability_zone
  size              = 30

  tags = {
    Name = "Dev-Volume"
  }
}



resource "aws_volume_attachment" "att1" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.volume1.id
  instance_id = aws_instance.server1.id





}

/*
resource "local_file" "file1" {
  filename = "test.txt"
  content = "Hello Kwasi"
}
*/

