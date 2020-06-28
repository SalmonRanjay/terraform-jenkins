resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "InternetGateway-${terraform.workspace}"
  }
}

resource "aws_route_table" "publicRouteTable" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "T Modules -${terraform.workspace}"
  }
}

resource "aws_route_table_association" "prtAssociation" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.publicRouteTable.id
}