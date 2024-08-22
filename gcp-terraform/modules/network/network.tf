resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_firewall" "allow_https" {
  name = "allow-https"
  source_ranges= ["0.0.0.0/0"]
  network = google_compute_network.vpc_network.id
  project= var.project_id

  allow { 
    protocol = "tcp"
    ports = ["80", "443"]
  }
}

resource "google_compute_firewall" "iap" {
  name = "allow-ssh-rdp-iap"
  source_ranges = ["35.235.240.0/20"]
  network = google_compute_network.vpc_network.id
  project = var.project_id

  allow {
    protocol = "tcp"
    ports = ["22", "3389"]
  }
}

resource "google_compute_subnetwork" "web_subnet" {
  name          = "web-subnet"
  ip_cidr_range = var.web_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}


resource "google_compute_global_address" "private_ip_range" {
  name          = "google-managed-services-vpc-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = google_compute_network.vpc_network.id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_range.name]
}




