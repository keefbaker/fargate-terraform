variable "region" {
  default = "eu-west-1"
}

variable "vpcid" {}

variable "subnets" {
  type = "list"
}

variable "lbname" {}
variable "cluster_name" {}

variable "ingress_from" {
  default = 80
}

variable "ingress_to" {
  default = 80
}

variable "ingress_cidr" {
  default = ["0.0.0.0/0"]
}

variable "ingress_proto" {
  default = "tcp"
}

variable "egress_from" {
  default = 0
}

variable "egress_to" {
  default = 0
}

variable "egress_cidr" {
  default = ["0.0.0.0/0"]
}

variable "egress_proto" {
  default = "-1"
}

variable app_name {}

variable app_port {
  default = "80"
}

variable app_proto {
  default = "HTTP"
}

variable listener_port {
  default = "80"
}

variable listener_proto {
  default = "HTTP"
}

variable template_file {
  default = "service_def.tpl"
}

variable service_mem {
  default = "512"
}

variable container_image {
  default = "nginxdemos/hello:latest"
}

variable service_cpu {
  default = "256"
}

variable "app_count" {
  default = "2"
}

variable "profile" {
  default = "devtest"
}
