variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = "string"
}
variable "vpc-name" {
  default = "terraform_vpc"
  type    = "string"
}
variable "public-subnet-name" {
  default = "terraform_public_subnet"
  type    = "string"
}
variable "private-subnet-name" {
  default = "terraform_private_subnet"
  type    = "string"
}
variable "route-table-name" {
  default = "terraform_route_table"
  type    = "string"
}
variable "internet-gateway-name" {
  default = "terraform_route_table"
  type    = "string"
}
variable "public-security-group-name" {
  default = "terraform_public_sg"
  type    = "string"
}
variable "private-security-group-name" {
  default = "terraform_private_sg"
  type    = "string"
}
variable "security-group-cidr-block" {
  default = "0.0.0.0/0"
  type    = "string"
}
variable "keypair_name" {
  default = "iQuartic-KeyPair"
  type    = "string"
}
variable "instance_type" {
  default = "t2.micro"
  type    = "string"
}
