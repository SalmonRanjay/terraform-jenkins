data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "amzlinux" {

  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]

}

resource "aws_instance" "web" {
  count         = "${var.ec2_count}"
  ami           = "${data.aws_ami.amzlinux.id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.subnet_id}"
  key_name      = "microservice-course-keypair"
  vpc_security_group_ids = "${var.security_groups}"
  user_data  = file("${path.module}/userdata.sh")
#   associate_public_ip_address = true
  tags = {
    Name = "Terraform_Module-${terraform.workspace}"
  }
}
