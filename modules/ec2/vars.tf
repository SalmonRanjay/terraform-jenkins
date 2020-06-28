
  variable "ec2_count" {
      type = string
      default = "1"
  }

  variable "ami_id" {
  }

  variable "instance_type" {
      type = string
      default = "t2.micro"
  }

  variable "subnet_id" {
  }

  variable "security_groups" {
    type = list
    description = "Security Groups"
}