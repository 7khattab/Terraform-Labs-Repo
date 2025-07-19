provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = var.ec2-type[terraform.workspace]
  # OR by using lookup function
   #instance_type = lookup(var.ec2-type , terraform.workspace)
  tags = {
    Name = "workspace-${terraform.workspace}"
  }
}
