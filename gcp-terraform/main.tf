module "network" {
  source          = "./modules/network"
  project_id      = var.project_id
  web_subnet_cidr = var.web_subnet_cidr
  region          = var.region
  vpc_network     = var.vpc_network
}

module "compute" {
  source          = "./modules/compute"
  instance_count  = var.instance_count
  region          = var.region
  startup_script  = var.startup_script
  project_id      = var.project_id
  vpc_network_id  = module.network.vpc_network_id
  web_subnet_id   = module.network.web_subnet_id
  vm_image        = var.vm_image
  vm_machine_type = var.vm_machine_type
}


module "load_balancer" {
  source             = "./modules/load_balancer"
  project_id         = var.project_id
  region             = var.region
  web_instance_group = module.compute.instance_group
  web_subnet_id      = module.network.web_subnet_id
}

module "cloud_sql" {
  source        = "./modules/cloud_sql"
  region        = var.region
  sql_tier      = var.sql_tier
  vpc_network   = module.network.vpc_network_id
  database_name = var.database_name
  db_username   = var.db_username
  db_password   = var.db_password

  depends_on = [module.network]
}
