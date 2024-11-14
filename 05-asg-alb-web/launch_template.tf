# Plantilla para crear instancias
resource "aws_launch_template" "lt" {
  name_prefix = "proyecto-"



  iam_instance_profile {
    name = "test"
  }

  image_id = "ami-test"

  instance_initiated_shutdown_behavior = "terminate"

  instance_market_options {
    market_type = "spot"
  }

  instance_type = "t2.micro"

  kernel_id = "test"

  key_name = "test"

  network_interfaces {
    associate_public_ip_address = true
  }

  placement {
    availability_zone = "us-east-1a"
  }


  vpc_security_group_ids = [aws_subnet.subnet_public.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }


}
