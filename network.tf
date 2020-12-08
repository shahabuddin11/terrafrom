resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev-vpc.id
  tags = merge(
  {
    "Name"        = format("%s-gateway-%s", var.name, var.environment)
    "Environment" = format("%s", var.environment)
  },
  var.additional_tags
  )
}
resource "aws_route_table" "dev-public-crt" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.dev-igw.id
  }

  tags = merge(
  {
    "Name"        = format("%s-route-%s", var.name, var.environment)
    "Environment" = format("%s", var.environment)
  },
  var.additional_tags
  )
}
resource "aws_route_table_association" "dev-crt-public-subnet-1"{
  subnet_id = aws_subnet.dev-subnet-public-1.id
  route_table_id = aws_route_table.dev-public-crt.id
}
resource "aws_security_group" "ssh-allowed" {
  vpc_id = aws_vpc.dev-vpc.id

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    // This means, all ip address are allowed to ssh !
    // Do not do it in the production.
    // Put your office or home address in it!
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(
  {
    "Name"        = format("%s-security-%s", var.name, var.environment)
    "Environment" = format("%s", var.environment)
  },
  var.additional_tags
  )
}
