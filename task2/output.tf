output "alb_dns" {
  value       = aws_lb.app_alb.dns_name
  description = "Access the app using this ALB DNS"
}

output "asg_name" {
  value       = aws_autoscaling_group.asg.name
  description = "The name of the Auto Scaling Group"
}
