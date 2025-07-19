provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = "ami-020cba7c55df1f615" 
  instance_type = var.instance_type

  tags = {
    Name = "${var.name_prefix}-${count.index}"
  }
}
