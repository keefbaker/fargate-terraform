output "cluster" {
  value = "${aws_ecs_cluster.main.id}"
}

output "lb" {
  value = "${aws_lb.main.id}"
}

output "lb_sg" {
  value = "${aws_security_group.lb.id}"
}
