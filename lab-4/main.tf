# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
# create a kay 
resource "aws_key_pair" "deploy-key" {
  key_name   = "deployer-key"
  public_key = file("C:/Users/Nvidia/.ssh/my-key.pub")

}
# create a ec2 instance
resource "aws_instance" "test" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
  key_name = aws_key_pair.deploy-key.key_name  # connect the public key with instance 
  tags = {
    Name = "tera-test"
  }


  # remote-exec provisioner Apache download
provisioner "remote-exec" {
  inline = [
    "sudo apt-get update",
    "sudo apt-get install -y apache2",
    "sudo systemctl start apache2",
    "sudo systemctl enable apache2"
  ]

  connection {
    type        = "ssh"
    user        = "ubuntu"  
    private_key = file("C:/Users/Nvidia/.ssh/my-key")  
    host        = self.public_ip
  }
}

  provisioner "local-exec" {
    command = "echo ${aws_instance.test.private_ip} > private_ip.txt"
  }   
 }