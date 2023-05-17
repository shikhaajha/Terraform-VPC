variable "vpc_id"{
    description = "vpc id"
    type = string 
    default = ""
}


#from the vpc module
variable "subnet_id"{
    description = "public subnet id"
    type = string 
    default = ""
}

variable "subnet_id2"{
    description = "public subnet id"
    type = string 
    default = ""
}
variable "security_group"{
    description = "security groups that was created in the vpc"
    type = string
    default = ""
}
variable "key"{
    description = "key-pair of ec2 instance"
    type = string
    default = "sikha_auth_key"
}