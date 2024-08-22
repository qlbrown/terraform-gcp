variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "web_subnet_cidr" {
  type = string
}

variable "allow_https" {
  type = bool
  default = true
}

