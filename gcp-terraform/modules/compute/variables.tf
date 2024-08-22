variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "vm_machine_type" {
  type    = string
  default = "e2-micro"
}

variable "vm_image" {
  type = string
}

variable "startup_script" {
  type = string
}

variable "instance_count" {
  type        = number
}

variable "web_subnet_id" {
  type = string
}


variable "vpc_network_id" {
  type = string
}

