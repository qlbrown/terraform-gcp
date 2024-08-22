#output "instance_group" {
#  value = google_compute_region_instance_group_manager.web_instance_group.self_link
#}

output "instance_group" {
  value = google_compute_region_instance_group_manager.web_instance_group.instance_group
}
