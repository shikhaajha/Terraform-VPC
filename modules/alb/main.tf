# create application Load  balancr
resource "aws_lb"  "application_load_balancer"{
  name  ="shikhademo-lb"
  internal   = false
  load_balancer_type ="application"
  security_groups = [var.security_group]
  subnets  = [var.subnet_id,var.subnet_id2]
enable_deletion_protection  = false

tags   =  {
     Name  = "shikha-alb"
}
}
# define the target groups
# create  the target groups
resource "aws_lb_target_group" "aws_lb_target"{
   name  =  "shikha-lb"
   target_type="instance"
   port = 80
   protocol ="HTTP"
   vpc_id = var.vpc_id

   health_check {
      enabled  = true
      interval = 300
      path ="/"
      timeout = 60
      matcher =200
      healthy_threshold  = 5
      unhealthy_threshold = 5

   }
     lifecycle {
       create_before_destroy = false

     }  
}
#Attach the target groups to the load balancer

resource "aws_lb_target_group_attachment" "target_groupi"{
   target_group_arn = aws_lb_target_group.aws_lb_target.arn
    target_id = var.instance_id1


}

resource "aws_lb_target_group_attachment" "target_groupii"{
   target_group_arn = aws_lb_target_group.aws_lb_target.arn
    target_id = var.instance_id1


}


 

#create listener
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn  = aws_lb.application_load_balancer.arn
  port               =  80
  protocol           ="HTTP"
  
  default_action{
     type ="forward"
     target_group_arn = aws_lb_target_group.aws_lb_target.arn
  }
}








 