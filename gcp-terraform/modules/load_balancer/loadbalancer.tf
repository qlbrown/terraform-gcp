resource "google_compute_global_address" "default" {
  name = "load-balancer-ip"
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "http-rule"
  load_balancing_scheme = "EXTERNAL"
  port_range = "80"
  target     = google_compute_target_http_proxy.default.self_link
}

resource "google_compute_target_http_proxy" "default" {
  name        = "http-lb-proxy"
  url_map     = google_compute_url_map.default.self_link
}

resource "google_compute_url_map" "default" {
  name            = "web-map"
  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_backend_service" "default" {
  name = "backend-service"
  protocol = "HTTP"
  
  backend {
     group = var.web_instance_group
  }

  port_name = "http"
  health_checks = [google_compute_health_check.default.id]
}


resource "google_compute_health_check" "default" {
  name = "web-health-check"
  http_health_check {
    port = 80
  }
}
