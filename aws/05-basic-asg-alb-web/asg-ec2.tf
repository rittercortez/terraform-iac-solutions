# Load Balancer (ALB) externo que distribuirá tráfico a las instancias EC2.
resource "aws_lb" "lb_asg" {
  name               = "ELB-EC2"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_ec2.id]
  subnet_mapping {
    subnet_id = aws_subnet.subnet_public.id
  }

  enable_deletion_protection = false # LocalStack no soporta protección de eliminación
  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "tg" {
  name        = "alb-tg"
  target_type = "instance" # Ajustado para instancias EC2
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc_principal.id
}


# Listener que escucha el tráfico en el puerto 80 del LB y lo envía al grupo de destino.
resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.lb_asg.arn
  port              = "80"                 
  protocol          = "HTTP"               

  # Acción por defecto: redirige el tráfico al grupo de destino.
  default_action {
    type             = "forward"           # Redirige el tráfico al Target Group.
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# Auto Scaling Group (ASG) que administra automáticamente el número de instancias EC2.
resource "aws_autoscaling_group" "asg" {
  desired_capacity     = 2                 
  max_size             = 5                 
  min_size             = 2                 
  vpc_zone_identifier  = [aws_subnet.subnet_public.id]  # Subnets donde se lanzan las instancias.
  target_group_arns    = [aws_lb_target_group.tg.arn] # Asocia el ASG al Target Group.
  
  # Usa una plantilla de lanzamiento para definir cómo se crearán las instancias EC2.
  launch_template {
    id      = aws_launch_template.lt.id 
    version = "$Latest"                    
  }
}

# Política de escalado basada en la utilización de CPU
resource "aws_autoscaling_policy" "scale_up_policy" {
  name                   = "cpu-scale-up-policy"  # Agregar el nombre que identifica la política.
  autoscaling_group_name = aws_autoscaling_group.asg.name

  policy_type = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 70  # Escalará cuando la utilización promedio de CPU supere el 70%.
  }
}
# Política de escalado hacia abajo
resource "aws_autoscaling_policy" "scale_down_policy" {
  name                   = "cpu-scale-down-policy"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 30  # Escalará hacia abajo cuando la CPU esté por debajo del 30%.
  }
}
