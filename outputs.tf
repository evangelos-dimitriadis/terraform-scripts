output "hello-world" {
  description = "Print a Hello World text output"
  value       = "Hello World"
}
output "vpc_id" {
  description = "Output the ID for the primary VPC"
  value       = aws_vpc.vpc.id
}
output "vpc_information" {
  description = "VPC Information about Environment"
  value = "Your ${aws_vpc.vpc.tags.Environment} VPC has an ID of ${aws_vpc
  .vpc.id}"
}
output "public_ip" {
  value = module.server.public_ip
}
# output "asg_group_size" {
#   value = module.autoscaling.autoscaling_group_max_size
# }
output "so_secret" {
  value     = var.so_secret
  sensitive = true
}
