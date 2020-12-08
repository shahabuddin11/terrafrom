
#Create a ssh through the terraform
# resource "tls_private_key" "dev" {
#   algorithm = "RSA"
#  rsa_bits  = 4096
# }
# resource "aws_key_pair" "generated_key" {
#  key_name   = var.key_name
#  public_key = tls_private_key.dev.
#   }
# If you want to used existing key associated with  the instance
#please comment the above code and pass key name into the
#key name
resource "aws_instance" "test" {
  ami = lookup(var.AMI, var.AWS_REGION)
  instance_type = "t3a.micro"
  key_name = "test" #keyname 
  # VPC
  subnet_id = aws_subnet.dev-subnet-public-1.id
  # Security Group
  vpc_security_group_ids = [
    aws_security_group.ssh-allowed.id]
  tags = merge(
  {
    "Name"        = format("%s-Instance-%s", var.name, var.environment)
    "Environment" = format("%s", var.environment)
  },
  var.additional_tags
  )
}
