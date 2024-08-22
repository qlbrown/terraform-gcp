resource "google_sql_database_instance" "default" {
  name             = "cloud-sql-instance"
  database_version = "MYSQL_5_7"
  region           = var.region

  settings {
    tier          = var.sql_tier
    ip_configuration {
      private_network = var.vpc_network
    }
  }
  deletion_protection = false
}

resource "google_sql_database" "default" {
  name     = var.database_name
  instance = google_sql_database_instance.default.name
}

resource "google_sql_user" "db_user" {
  name     = var.db_username
  instance = google_sql_database_instance.default.name
  password = var.db_password
}
