
# config the s3 bucket 
resource "aws_s3_bucket" "s3" {
  bucket = "terraform_testbd"
  

  tags = {
    Name        = "My bucket"
  }
}


# config the security group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0388a29677c590dc5"

  tags = {
    Name = "allow_tls"
  }
    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    
  }

}