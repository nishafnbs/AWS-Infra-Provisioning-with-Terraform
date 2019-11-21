/*
  This is the Security Group part. In this we have two security groups.
    1) Public Security Group
        for public SG, we have opened port 22 so we can connect to that instance and we have opened all outbount ports for it.

    2) Private Security Group
        For Private SG, we only want to give public subnet resources to access private subnet resources. So here we will allow port 22 against public SG only. So this way, any EC2 instance in public subnet can connect to Instance in private subnet.

*/

resource "aws_security_group" "tf-public-sg" {
  name        = "${var.public-security-group-name}"
  description = "Cluster communication with worker nodes"
  vpc_id      = "${aws_vpc.tf-vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.security-group-cidr-block}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.security-group-cidr-block}"]
  }

  tags = {
    Name = "${var.public-security-group-name}"
  }
}


resource "aws_security_group" "tf-private-sg" {
  name        = "${var.private-security-group-name}"
  description = "Cluster communication with worker nodes"
  vpc_id      = "${aws_vpc.tf-vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = ["${aws_security_group.tf-public-sg.id}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.security-group-cidr-block}"]
  }

  tags = {
    Name = "${var.private-security-group-name}"
  }
}
