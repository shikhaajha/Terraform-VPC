#creating instance 
resource "aws_instance" "shikha1" {
    ami = "ami-007855ac798b5175e"
    instance_type ="t2.micro"
    subnet_id = var.subnet_id
    vpc_security_group_ids = [var.security_group]
    key_name = "sikha_auth_key"
    root_block_device {
        volume_size = 8
        volume_type ="gp3"
    }
    tags = {
        Name = "shikha"
        use = "terraform"
    }
    user_data =<<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
}

resource "aws_instance" "shikha2" {
    ami = "ami-007855ac798b5175e"
    instance_type ="t2.micro"
    subnet_id = var.subnet_id2
    vpc_security_group_ids = [var.security_group]
    key_name = "sikha_auth_key"
    root_block_device {
        volume_size = 8
        volume_type ="gp3"
    }
    tags = {
        Name = "shikha-2"
        use = "terraform"
    }
    user_data =<<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              EOF
}
