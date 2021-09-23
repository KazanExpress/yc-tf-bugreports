
module "postgres" {
  source = "../../modules/postgresql"

  name        = "yc-bug-postgresql"
  description = "PostgreSQL for demonstrating bug of terraform provider"

  database_config_values = [{
    conn_limit = 50
    database   = "dev"
    extensions = []
    username   = "devUser"
    },
    {
      conn_limit = 35
      database   = "prod"
      extensions = []
      username   = "prodUser"
    }
  ]

  resource_preset_id = "s2.micro"
}


provider "yandex" {
  token                    = var.yc_token
  cloud_id                 = var.yc_cloud_id
  folder_id                = var.yc_folder_id
  zone                     = "ru-central1-a"
}

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.64.0"
    }
  }
}