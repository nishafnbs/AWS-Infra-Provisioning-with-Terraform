## AWS Infra Provisioning with Terraform

In this Project, we provision a complete AWS Infra containing.
- 1 VPC
- 2 Subnets (1 Public & 1 Private)
- 2 SG's (1 for Public Subnet and 1 for Private Subnet)
- 1 Route Table (for Public Subnet)
- 1 Internet Gateway (to be attached to Public Subnet's Route Table)
- 2 EC2 Instances (1 in Public Subnet & 1 in Private Subnet)


So this project will give you a whole overview of how to provision AWS Infra and little understanding of Public and Private resources in AWS Cloud.
So we will be allowing public subnet to be accessible over the internet but the private Instance will only be accessible by the EC2 Instance that we provisioned in Public Subnet.
This also explains the concepts of Jump Servers.


## Terraform Installation

- Find the appropriate [Terraform distribution package](https://www.terraform.io/downloads.html) for your system and download it. Terraform is distributed as a single .zip file.

- After downloading Terraform, unzip the package to a directory of your choosing. Terraform runs as a single binary named terraform. Any other files in the package can be safely removed and Terraform will still function.

- Optional but highly recommended: modify the path to include the directory that contains the Terraform binary.
  - [How to set the $PATH on Linux and Mac](https://stackoverflow.com/questions/14637979/how-to-permanently-set-path-on-linux)
  - [How to set the PATH on Windows](https://stackoverflow.com/questions/1618280/where-can-i-set-path-to-make-exe-on-windows)

- An alternative to modifying the path is to move the Terraform executable to a directory that is normally included in the path by default, 
  for example: sudo mv terraform /user/local/bin
  
- Alternatively you can follow the following steps to install terraform on Linux Machine.
  - sudo apt-get update
  - sudo apt-get install wget unzip -y
  - cd /tmp && sudo wget "https://releases.hashicorp.com/terraform/0.12.13/terraform_0.12.13_linux_amd64.zip"
  - sudo unzip terraform_0.12.13_linux_amd64.zip
  - sudo mv terraform /usr/local/bin
  - terraform version
  - sudo rm -rf /tmp/terraform_0.12.13_linux_amd64.zip 
