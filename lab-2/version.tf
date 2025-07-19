# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# configure the IAM user 
resource "aws_iam_user" "Tera_user" {
  name = "Tera_user"
  tags = {
    tag-key = "tag-value"
  }
}

# configure the IAM policy
resource "aws_iam_user_policy" "user_policy" {
  name = "policy"
  user = aws_iam_user.Tera_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:AllocateAddress",    # تخصيص Elastic IP
          "ec2:AssociateAddress",   # ربط Elastic IP بـ NAT Gateway
          "ec2:CreateNatGateway",   # إنشاء NAT Gateway
          "ec2:DescribeAddresses",  # عرض Elastic IP
          "ec2:DescribeNatGateways" # عرض NAT Gateway
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# configure the VPC 

resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test"
  }
}

# configure the subnet

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "public subnet"

  }
}

# configure the internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.test.id

  tags = {
    Name = "gw"
  }
}

# configure the route_tabel 

resource "aws_route_table" "test" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "route"
  }
}

# configure aws route table association

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.test.id
}

# configure the elastic ip 
resource "aws_eip" "lb" {

  domain = "vpc"
}


# configure NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

# Display the Elastic IP
output "eip_display" {
  value = aws_eip.lb
}

# Display the user_name arn
output "user_display" {
  value = aws_iam_user.Tera_user.arn

}

# Diapaly  NAT gateway ID
output "nat_gateway_display" {
  value = aws_nat_gateway.nat

}