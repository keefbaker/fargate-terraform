resource "aws_ecs_task_definition" "app" {
  family                   = "${var.app_name}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.cpu}"
  memory                   = "${var.ram}"

  container_definitions = "${var.task_definition}"
}

resource "aws_ecs_service" "main" {
  name            = "${var.app_name}"
  cluster         = "${var.cluster}"
  task_definition = "${aws_ecs_task_definition.app.arn}"
  desired_count   = "${var.app_count}"
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = ["${aws_security_group.ecs_tasks.id}"]
    subnets         = "${var.subnets}"
  }

  load_balancer {
    target_group_arn = "${aws_alb_target_group.app.id}"
    container_name   = "${var.app_name}"
    container_port   = "${var.app_port}"
  }

  depends_on = [
    "aws_alb_listener.app",
  ]
}
