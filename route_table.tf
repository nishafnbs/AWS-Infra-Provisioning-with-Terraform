/*
	This is a Route Table defined for Public subnet so we can attach Internet Gateway to this Route Table and this Route Table will be attached to Public Subnet.
*/

resource "aws_route_table" "tf-route-table" {
  vpc_id = "${aws_vpc.tf-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tf-internet-gateway.id}"
  }
  tags = {
      Name = "${var.route-table-name}"
  }
}