variable "vpc_id" {
    description = "VPC id of the VPC that we have created"
    type        = string
    default     = ""
}

variable "security_group" {
   description = "this security group created in vpc"
   type        = string
   default     = ""
}


variable "subnet_id" {
    description = "subnet id of public subnet that we have created"
    type        = string
    default     = ""
}
variable "subnet_id2" {
    description = "subnet id of the private subnet  VPC that we have created"
    type        = string
    default     = ""
}