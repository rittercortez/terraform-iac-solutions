# El recurso de Load balance solamente se lanzará en el entorno de Producción
resource "aws_lb" "lb" {
  count               = var.environment == var.lb_conditional ? 1 : 0
  load_balancer_type  = var.lb_type
  internal            = false
  subnets             = [aws_subnet.example_subnet.id]
  security_groups     = [aws_security_group.lb_sg.id]
  tags = {
    Name = var.lb_name
  }
}
