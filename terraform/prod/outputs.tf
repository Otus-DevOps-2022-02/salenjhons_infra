#output "external_ip_address_app" {
# value = yandex_compute_instance.app.*.network_interface.0.nat_ip_address
#}

output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}

output "external_ip_address_db" {
  value = module.db.external_id_address_db
}

#output "external_ip_address_app_lb" {
# value = yandex_alb_load_balancer.app-balancer.listener.0.endpoint.0.address.0.external_ipv4_address
#}
