terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "salenjhons-bucket"
    region     = "ru-central1-b"
    key        = "stage/terraform.tfstate"
    access_key = "YCAJEf_cL-KZnQUoW6b2TjMiU"
    secret_key = "YCPmJiqBKyXXteHOsStQ4IiC-ccojfvOcvfbwwbS"
    skip_region_validation      = true
    skip_credentials_validation = true
   }
}
