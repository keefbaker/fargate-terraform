module "cluster" {
  source        = "./cluster"
  region        = "${var.region}"
  subnets       = "${var.subnets}"
  vpcid         = "${var.vpcid}"
  lbname        = "${var.lbname}"
  cluster_name  = "${var.cluster_name}"
  egress_proto  = "${var.egress_proto}"
  egress_from   = "${var.egress_from}"
  egress_to     = "${var.egress_to}"
  egress_cidr   = "${var.egress_cidr}"
  ingress_proto = "${var.ingress_proto}"
  ingress_from  = "${var.ingress_from}"
  ingress_to    = "${var.ingress_to}"
  ingress_cidr  = "${var.ingress_cidr}"
}

data "template_file" "ecs_task" {
  template = "${file("${var.template_file}")}"

  vars {
    appname = "${var.app_name}"
    cpu     = "${var.service_cpu}"
    mem     = "${var.service_mem}"
    image   = "${var.container_image}"
    port    = "${var.app_port}"
  }
}

module "fargate_service" {
  source          = "./fargate_service"
  app_name        = "${var.app_name}"
  app_port        = "${var.app_port}"
  app_proto       = "${var.app_proto}"
  listener_port   = "${var.listener_port}"
  listener_proto  = "${var.listener_proto}"
  lb_id           = "${module.cluster.lb}"
  cluster         = "${module.cluster.cluster}"
  vpcid           = "${var.vpcid}"
  task_definition = "${data.template_file.ecs_task.rendered}"
  cpu             = "${var.service_cpu}"
  ram             = "${var.service_mem}"
  container_name  = "${var.container_image}"
  subnets         = "${var.subnets}"
  app_count       = "${var.app_count}"
  lb_sg           = "${module.cluster.lb_sg}"
}
