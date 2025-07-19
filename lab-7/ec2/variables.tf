variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for the instance names"
  type        = string
} 