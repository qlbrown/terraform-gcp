output "web_subnet_id" {
  value = google_compute_subnetwork.web_subnet.id
}

output "vpc_network_self_link" {
  value = google_compute_network.vpc_network.self_link
}

output "vpc_network_id" {
  value = google_compute_network.vpc_network.id
}

