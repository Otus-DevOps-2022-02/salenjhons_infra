output external_id_address_db {
  value = yandex_compute_instance.db.network_interface.0.nat_ip_address
}
