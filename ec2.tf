
#Create a ssh through the terraform
resource "tls_private_key" "dev" {
  algorithm = "RSA"
 rsa_bits  = 4096
}
resource "aws_key_pair" "generated_key" {
 key_name   = var.key_name
 public_key = tls_private_key.dev.public_key_openssh
}

resource "aws_instance" "web1" {
  ami = lookup(var.AMI, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name = aws_key_pair.generated_key.key_name
  # VPC
  subnet_id = aws_subnet.dev-subnet-public-1.id
  # Security Group
  vpc_security_group_ids = [
    aws_security_group.ssh-allowed.id]
  tags = merge(
  {
    "Name"        = format("%s-vpc-%s", var.name, var.environment)
    "Environment" = format("%s", var.environment)
  },
  var.additional_tags
  )
}