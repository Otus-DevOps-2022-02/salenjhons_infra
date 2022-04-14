resource "yandex_alb_load_balancer" "app-balancer" {
  name       = "reddit-balancer"
  network_id = var.network_id

  allocation_policy {
    location {
      zone_id   = var.zone
      subnet_id = var.subnet_id
    }
  }

  listener {
    name = "my-listener"
    endpoint {
      address {
        external_ipv4_address {}
      }
      ports = [80]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.tf-router.id
      }
    }
  }
}

resource "yandex_alb_http_router" "tf-router" {
  name      = "reddit-http-router"
  folder_id = var.folder_id
}

resource "yandex_alb_target_group" "test-target-group" {
  name = "app-group"

  dynamic "target" {
    for_each = yandex_compute_instance.app.0.network_interface.*.ip_address
    content {
      subnet_id  = var.subnet_id
      ip_address = target.value
    }
  }
}

resource "yandex_alb_virtual_host" "app-virtual-host" {
  name           = "my-vhost"
  http_router_id = yandex_alb_http_router.tf-router.id
  route {
    name = "app-route"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.app-backend-group.id
        timeout          = "3s"
      }
    }
  }
}

resource "yandex_alb_backend_group" "app-backend-group" {
  name = "my-group"

  http_backend {
    name             = "test-http-backend"
    weight           = 1
    port             = 9292
    target_group_ids = yandex_alb_target_group.test-target-group.*.id
    load_balancing_config {
      panic_threshold = 70
    }
    healthcheck {
      timeout           = "1s"
      interval          = "1s"
      healthy_threshold = 2
      http_healthcheck {
        path = "/"
      }
    }
  }
}
