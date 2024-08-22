variable "region" {
  type        = string
}

variable "sql_tier" {
  type        = string
}

variable "vpc_network" {
  type        = string
}

variable "database_name" {
  type        = string
}

variable "db_username" {
  type        = string
}

variable "db_password" {
  type        = string
  sensitive   = true
}



