resource "aws_db_subnet_group" "shikha_db"{
  
    name = "shikha_subnet"
    description = "Database subnet group"
    subnet_ids = [var.subnet_id,var.subnet_id2]
    tags = {
        Name = "shikha_subnet"
    }
}
resource "aws_db_instance" "default" {
  allocated_storage             = 10
  identifier                    ="shikha"
  db_name                       = "mydb"
  engine                        = "mysql"
  engine_version                = "8.0.32"
  instance_class                = "db.t2.micro"
  username                      = "shikha"
  db_subnet_group_name          = aws_db_subnet_group.shikha_db.name
  password                      = "shikha12345"
  skip_final_snapshot           = true
  tags = {
    Name = "shikha _db"
  }
}


