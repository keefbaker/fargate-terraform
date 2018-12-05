resource "aws_alb_target_group" "app" {
  name        = "${var.app_name}"
  port        = "${var.app_port}"
  protocol    = "${var.app_proto}"
  vpc_id      = "${var.vpcid}"
  target_type = "ip"
}

resource "aws_alb_listener" "app" {
  load_balancer_arn = "${var.lb_id}"
  port              = "${var.listener_port}"
  protocol          = "${var.listener_proto}"

  default_action {
    target_group_arn = "${aws_alb_target_group.app.id}"
    type             = "forward"
  }
}

resource "aws_security_group" "ecs_tasks" {
  name        = "${var.app_name}"
  description = "${var.app_name}"
  vpc_id      = "${var.vpcid}"

  ingress {
    protocol        = "${var.sg_proto}"
    from_port       = "${var.app_port}"
    to_port         = "${var.app_port}"
    security_groups = ["${var.lb_sg}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
