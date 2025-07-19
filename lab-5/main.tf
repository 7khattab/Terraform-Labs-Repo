# Configure the AWS Provider default
provider "aws" {
  region = "us-east-1"
}
# conffigure the AWS provider non-default
provider "aws" {
    region = "us-west-1"
    alias = "west"
  
}
# new iam user
resource "aws_iam_user" "terra_user" {
  name = "terra-user"
}

# make an AdministratorAccess 
resource "aws_iam_user_policy_attachment" "admin_policy" {
  user       = aws_iam_user.terra_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# make Access Key & Secret Key
resource "aws_iam_access_key" "terraform_user_key" {
  user = aws_iam_user.terra_user.name
}

# make an instance in default region 
resource "aws_instance" "east_instance" {
  ami           = "ami-020cba7c55df1f615" # Ubuntu us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "EastInstance"
  }
}

# make an instance in a non-default region 
resource "aws_instance" "west_instance" {
  provider      = aws.west
  ami           = "ami-014e30c8a36252ae5" # Ubuntu us-west-1
  instance_type = "t2.micro"

  tags = {
    Name = "WestInstance"
  }
}

# import an instance that made by AWS console 
import {
  to = aws_instance.manually_created
  id = "i-07d2efc2633041590"
}
