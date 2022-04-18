terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "salenjhons-bucket"
    region     = "ru-central1-b"
    key        = "stage/terraform.tfstate"
    access_key = "Y************************U"
    secret_key = "Y************************b"
    skip_region_validation      = true
    skip_credentials_validation = true
   }
}
