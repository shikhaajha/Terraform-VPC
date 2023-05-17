output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.vpcdemo.id
}
output "public_subnet" {
    description = "public subnet ID"
    value = aws_subnet.public_subnet.id
}

output "security"{
    description = "security group services"
    value = aws_security_group.shi_sg.id
}
output "public_subnet2" {
    description = "public subnet ID"
    value = aws_subnet.public_subnet2.id
}