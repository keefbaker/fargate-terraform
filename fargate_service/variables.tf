variable "app_name" {}
variable "app_port" {}

variable "app_proto" {
  default = "HTTP"
}

variable "listener_port" {}

variable "listener_proto" {
  default = "HTTP"
}

variable "sg_proto" {
  default = "tcp"
}

variable "lb_id" {}
variable "vpcid" {}
variable "task_definition" {}
variable "cpu" {}
variable "ram" {}
variable container_name {}
variable cluster {}

variable subnets {
  type = "list"
}

variable "app_count" {}
variable "lb_sg" {}
