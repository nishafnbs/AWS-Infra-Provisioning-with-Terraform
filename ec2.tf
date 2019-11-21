data "aws_ami" "ubuntu_linux" {
  /*
    Linux AWS Ubuntu AMI being used .
  */
  most_recent = true

  owners = ["099720109477"]

  filter {
    name = "name"

    values = [
      "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*",
    ]
  }
}

resource "aws_instance" "tf-public-instance" {
  /*
    AWS Instance deployed in a public subnet. 
  */
  
  ami           = data.aws_ami.ubuntu_linux.id
  instance_type = "${var.instance_type}"
  key_name = "${var.keypair_name}"
  subnet_id     = "${aws_subnet.tf-public-subnet.id}"
  vpc_security_group_ids      = ["${aws_security_group.tf-public-sg.id}"]
  associate_public_ip_address = true
  //user_data = "${file("install_jenkins.sh")}"
  user_data = <<-EOF
                #! /bin/bash
                sudo apt update
                sudo apt install openjdk-8-jdk ufw -y
                wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
                sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
                sudo apt update -y
                sudo apt install jenkins -y
                sudo service jenkins start
        EOF
  //user_data = "${template_file.user_data.rendered}"
  root_block_device {
      volume_type = "standard"
      volume_size = 10
  }

  ebs_block_device {
      device_name = "/dev/sdb"
      volume_type = "standard"
      volume_size = 5
  }

  tags = {
    "DeployedbyTerraform"      = "Yes"
    "Name" = "DevOps-Terraform-Public-Instance"
  }
}

resource "aws_instance" "tf-private-instance" {
  /*
    AWS Instance deployed in a private subnet. 
  */

  ami           = data.aws_ami.ubuntu_linux.id
  instance_type = "${var.instance_type}"
  key_name = "${var.keypair_name}"
  subnet_id     = "${aws_subnet.tf-private-subnet.id}"
  vpc_security_group_ids      = ["${aws_security_group.tf-private-sg.id}"]

  root_block_device {
      volume_type = "standard"
      volume_size = 10
  }

  tags = {
    "DeployedbyTerraform"      = "Yes"
    "Name" = "DevOps-Terraform-Private-Instance"
  }
}