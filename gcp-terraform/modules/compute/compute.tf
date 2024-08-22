resource "google_compute_instance_template" "web_template" {
  name         = "web-instance-template"
  region       = var.region

  disk {
    auto_delete = true
    boot        = true
    source_image = "projects/debian-cloud/global/images/family/debian-11"
  }


  metadata = {
    startup_script = var.startup_script
}
  
  network_interface {
    network    = var.vpc_network_id
    subnetwork = var.web_subnet_id
  }

  machine_type = var.vm_machine_type
}

resource "google_compute_region_instance_group_manager" "web_instance_group" {
  name               = "web-instance-group"
  region             = var.region
  base_instance_name = "web-instance"

  version {
    instance_template = google_compute_instance_template.web_template.self_link
  }

  target_size = var.instance_count
}
