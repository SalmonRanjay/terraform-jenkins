output "vpc_id" {
    value = "${aws_vpc.main.id}"
}

output "subnet_id" {
    value = "${aws_subnet.main.id}"
}

output "security_groups" {
    value = "${aws_security_group.jenkins-sg.id}"
}