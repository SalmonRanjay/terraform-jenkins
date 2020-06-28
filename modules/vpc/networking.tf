locals{
    world_access = "0.0.0.0/0"
}

resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags = {
    Name = "Terraform Modules-${terraform.workspace}"
  }
}


resource "aws_subnet" "main" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"
  map_public_ip_on_launch = true

  tags = {
    Name = "Terraform Modules-${terraform.workspace}"
  }
}

resource "aws_security_group" "jenkins-sg" {
  name        = "jenkins_sg-${terraform.workspace}"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"
   
  ingress {
    description = "jenkins sg"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins-SG-${terraform.workspace}"
  }
}
