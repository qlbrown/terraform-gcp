variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east1"
}

variable "vpc_network" {
  type    = string
  default = "vpc-network"
}


variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "web_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}


variable "instance_count" {
  type    = number
  default = 1
}

variable "vm_machine_type" {
  type    = string
  default = "e2-micro"
}

variable "vm_image" {
  type    = string
  default = "debian-cloud/debian-10"
}

variable "startup_script" {
  type    = string
  default = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2 nginx mysql-client
    sudo service nginx start
    
    # Create a simple HTML file
    echo "<h1>Welcome to Anna Urgent Care!</h1>" | sudo tee /var/www/html/index.html
    
    # Connect to Cloud SQL using internal IP
    mysql -h <google_sql_database_instance.default.private_ip_address> -u db_user -p'db_password' -e "CREATE DATABASE IF NOT EXISTS mydatabase;"
  EOT
}
  
variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "database_name" {
  type = string
}

variable "sql_tier" {
  type    = string
  default = "db-f1-micro"
}


