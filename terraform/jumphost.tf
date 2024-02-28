resource "aws_security_group" "jumphost_sg" {
  name        = "jumphost-sg"
  description = "Security group for jumphost"
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jumphost" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.jumphost_sg.id]
  subnet_id              = tolist(module.vpc.public_subnets)[0]
  associate_public_ip_address = true
  user_data = templatefile("./install-tools.sh", {})

  tags = {
    Name = "Jumphost-server"
  }
}