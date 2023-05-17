#Create VPC
resource "aws_vpc" "vpcdemo" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default" #or can be dedicated, default is "default"
      #default is true
  # enable_dns_hostnames = true      #default is false
  tags = {
    Name  = "shikhavpc"

  }
}


#Create Internet Gateway
resource "aws_internet_gateway" "shi_igw" {
  vpc_id = aws_vpc.vpcdemo.id
  tags = {
    Owner = "shikha"
  }
}

#Create a Public Subnet
resource "aws_subnet" "public_subnet" {
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true #this assigns public ip to the instance created inside the subnet
  vpc_id                  = aws_vpc.vpcdemo.id
  tags = {
    Name  = "public_subnet"
    Owner = "shikha"
  }
}

resource "aws_subnet" "public_subnet2" {
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true #this assigns public ip to the instance created inside the subnet
  vpc_id                  = aws_vpc.vpcdemo.id
  tags = {
    Name  = "public_subnet2"
    Owner = "shikha"
  }
}


#Create routetable for public subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpcdemo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.shi_igw.id
  }

  tags = {
    Name  = "public-rt"
    Owner = "shikha"
  }
}
##########################################################
#Assigning subnets to the public route table
resource "aws_route_table_association" "public_rt_asso" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}


#Create a security group
resource "aws_security_group" "shi_sg" {
  name        = "shi_sg"
  vpc_id = aws_vpc.vpcdemo.id
  description = "This is a security group containing inbound permissioin for ssh, http and https from anywhere"
  ingress {
        description = "HTTPS"
        from_port = 443
        to_port = 443
        cidr_blocks =["0.0.0.0/0"]
        protocol = "tcp"   
    }
    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks =["0.0.0.0/0"]  
    }
    ingress {
      description = "mysql"
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
   }

     egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
}
}
