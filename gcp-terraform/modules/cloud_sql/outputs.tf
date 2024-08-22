output "cloud_sql_instance_connection_name" {
  value = google_sql_database_instance.default.connection_name
}

output "cloud_sql_internal_ip" {
  value       = google_sql_database_instance.default.private_ip_address
}

