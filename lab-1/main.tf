
# Configure the AWS Provider

provider "aws" {
  region = "us-east-1"
  profile = "terraform-user"
}

# configure the VPC 

resource "aws_vpc" "test" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "test"
  }
}

# configure the subnet

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "public subnet"
    map_public_ip_on_launch = true
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

# configure aws_instance

resource "aws_instance" "terraform" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
=======
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  profile = "terraform-user"
}

# configure the VPC 
resource "aws_vpc" "test" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "test"
  }
}

# configure the subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "public subnet"
    map_public_ip_on_launch = true
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

# configure aws_instance
resource "aws_instance" "terraform" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
