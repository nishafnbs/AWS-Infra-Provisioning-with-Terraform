/*
	A provider is responsible for understanding API interactions and exposing resources. As we are using terraform to deploy resources on AWS so our provider will be AWS. and we are using all available availability zones.
*/
provider "aws" {
  region     = "us-east-1"
}
data "aws_availability_zones" "available" {}
