variable public_key_path {
  description = "Path to the public key used for ssh acces"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}

variable subnet_id {
  description = "Subnet for modules"
}
