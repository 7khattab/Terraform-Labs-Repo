module "EC2" {
    source = "./ec2"
    instance_count = 3
    instance_type  = "t2.micro"
    name_prefix    = "web"


}
