variable "ec2-type" {
type = map(any)
default = {
     dev =     "t2.micro"
     staging = "t2.medium"
     prod    = "t2.large"
}  
}
