# public ec2-1
resource "aws_instance" "public_ec2_1" {
  ami                    = var.EC2_AMI
  instance_type          = var.EC2_size
  subnet_id              = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.public_sg.id] # 使用 security group ID

  # attach iam role
  iam_instance_profile = aws_iam_instance_profile.ec2_admin_instance_profile.name

  tags = {
    Name = "${var.tags["name"]}-public-ec2-1"
  }
}

# public ec2-2
resource "aws_instance" "public_ec2_2" {
  ami                    = var.EC2_AMI
  instance_type          = var.EC2_size
  subnet_id              = aws_subnet.public_subnet_2.id
  vpc_security_group_ids = [aws_security_group.public_sg.id] # 使用 security group ID

  # attach iam role
  iam_instance_profile = aws_iam_instance_profile.ec2_admin_instance_profile.name

  tags = {
    Name = "${var.tags["name"]}-public-ec2-2"
  }
}

# private ec2-1
resource "aws_instance" "private_ec2_1" {
  ami                    = var.EC2_AMI
  instance_type          = var.EC2_size
  subnet_id              = aws_subnet.private_subnet_1.id
  vpc_security_group_ids = [aws_security_group.private_sg.id] # 使用 security group ID

  # attach iam role
  iam_instance_profile = aws_iam_instance_profile.ec2_admin_instance_profile.name

  tags = {
    Name = "${var.tags["name"]}-private-ec2-1"
  }
}

# private ec2-2
resource "aws_instance" "private_ec2_2" {
  ami                    = var.EC2_AMI
  instance_type          = var.EC2_size
  subnet_id              = aws_subnet.private_subnet_2.id
  vpc_security_group_ids = [aws_security_group.private_sg.id] # 使用 security group ID

  # attach iam role
  iam_instance_profile = aws_iam_instance_profile.ec2_admin_instance_profile.name

  tags = {
    Name = "${var.tags["name"]}-private-ec2-2"
  }
}
