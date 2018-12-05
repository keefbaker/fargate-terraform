resource "aws_lb" "main" {
  name            = "${var.lbname}"
  subnets         = "${var.subnets}"
  security_groups = ["${aws_security_group.lb.id}"]

  tags {
    "cluster" = "${var.cluster_name}"
  }
}

resource "aws_ecs_cluster" "main" {
  name = "${var.cluster_name}"
}

resource "aws_security_group" "lb" {
  name        = "${var.lbname}"
  description = "controls access to ${var.cluster_name} via ${var.lbname}"
  vpc_id      = "${var.vpcid}"

  ingress {
    protocol    = "${var.ingress_proto}"
    from_port   = "${var.ingress_from}"
    to_port     = "${var.ingress_to}"
    cidr_blocks = "${var.ingress_cidr}"
  }

  egress {
    from_port   = "${var.egress_from}"
    to_port     = "${var.egress_to}"
    protocol    = "${var.egress_proto}"
    cidr_blocks = "${var.egress_cidr}"
  }

  tags {
    "cluster" = "${var.cluster_name}"
  }
}
