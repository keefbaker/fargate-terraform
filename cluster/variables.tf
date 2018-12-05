variable "vpcid" {}

variable "subnets" {
  type = "list"
}

variable "lbname" {}
variable "cluster_name" {}
variable "ingress_from" {}

variable "ingress_to" {}

variable "ingress_cidr" {
  type = "list"
}

variable "ingress_proto" {}

variable "egress_from" {}

variable "egress_to" {}

variable "egress_cidr" {
  type = "list"
}

variable "egress_proto" {}

variable region {}
