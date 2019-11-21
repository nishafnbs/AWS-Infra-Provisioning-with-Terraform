/*
	Creating a separate AWS VPC for our work.
*/

resource "aws_vpc" "tf-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = "${
    map(
     "Name", "${var.vpc-name}",
     "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}