/*
  For this Project, we require two subnets.
    1) Public Subnet 
        For Public subnet, we will allow all resources to have public IP when they are launched in Public Subnet.
        Secondly, we will attach the Route table that we created before to this Public Subnet to allow it to communicate with outside world.

    2) Private Subnet
        Private Subnet will not assign public IP to any of its resource (As you can understand by its name.)
*/

resource "aws_subnet" "tf-private-subnet" {
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  cidr_block        = "10.0.2.0/24"
  vpc_id            = "${aws_vpc.tf-vpc.id}"

  tags = "${
    map(
     "Name", "${var.private-subnet-name}",
     "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}

resource "aws_subnet" "tf-public-subnet" {
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  cidr_block        = "10.0.1.0/24"
  vpc_id            = "${aws_vpc.tf-vpc.id}"
  map_public_ip_on_launch = "true"

  tags = "${
    map(
     "Name", "${var.public-subnet-name}",
     "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}


resource "aws_route_table_association" "demo" {
  count = 2

  subnet_id      = "${aws_subnet.tf-public-subnet.id}"
  route_table_id = "${aws_route_table.tf-route-table.id}"
}