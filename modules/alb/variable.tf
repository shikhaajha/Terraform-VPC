variable "instance_id1"{
    type = string
    default = ""
}
variable "instance_id2"{
    type = string
    default = ""
}
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
