variable "AWS_REGION" {
  default = "us-east-2"
}
variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = "Test"
}
variable "environment" {
  description = "Environment in tags to identidy"
  default     = "Dev"
}
variable "additional_tags" {
  type    = map(string)
  default = {}
}
variable "AMI" {
  type = map
  default = {
    us-east-2 = "ami-09558250a3419e7d0"

  }
}
variable "key_name" {
  default = "server"
}

variable "EC2_USER" {
  default = "ec2-user"
}
