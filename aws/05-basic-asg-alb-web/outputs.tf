# Información relevante que podemos ver desde la consola cuando ejecutemos el automatismo
output "id_asg" {
  description = "Muestra el ID de nuestro Auto Scaling Group"
  value = aws_autoscaling_group.asg.id
}
output "dns_elb" {
  description = "Muestra el DNS de nuestro Elastic Load Balancer"
  value = aws_lb.lb_asg.dns_name
}
output "id_vpc" {
  description = "Muestra el ID de nuestra VPC"
  value = aws_vpc.vpc_principal.id
}