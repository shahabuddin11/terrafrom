output "id" {
  description = " ID of the VPC"
  value       = aws_vpc.this[0].id
}
output "owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = aws_vpc.this[0].owner_id
}
output "arn" {
  description = "Amazon Resource Name (ARN) of VPC"
  value       = aws_vpc.this[0].arn
}
output "default_network_acl_id" {
  description = "The ID of the network ACL created by default on VPC creation"
  value       = aws_vpc.this[0].default_network_acl_id
}
output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = aws_vpc.this[0].default_security_group_id
}
output "default_route_table_id" {
  description = "The ID of the route table created by default on VPC creation"
  value       = aws_vpc.this[0].default_route_table_id
}


