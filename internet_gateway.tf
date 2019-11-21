/*
	This script creates an Internet Gateway for the Public subnet to use to communicate to outside world.
*/
resource "aws_internet_gateway" "tf-internet-gateway" {
  vpc_id = "${aws_vpc.tf-vpc.id}"

  tags = {
    Name = "${var.internet-gateway-name}"
  }
}
