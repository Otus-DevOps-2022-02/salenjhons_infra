variable "cloud_id" {
  description = "Cloud"
  type        = string
}

variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  default     = "ru-central1-b"
}
variable "public_key_path" {
  description = "Public key path"
}

variable "private_key_path" {
  description = "Private key path"
}

variable "image_id" {
  description = "Disk image"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "service_account_key_file" {
  description = "key.json"
}

variable "network_id" {
  description = "network id"
}

variable "instance_name" {
  description = "Name of instance"
  default     = "app-reddit"
}

variable "instance_count" {
  default = 1
}

variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable "db_disk_image" {
  description = "disk image for reddit db"
  default     = "reddit-db-base"
}
