
module "postgres" {
  source = "../../modules/postgresql"

  name = "bug-report-2"
  databases = [
    {
      name  = "example",
      owner = "owner",
      extensions = [
        {
          name = "pgcrypto"
        }
      ],
      lc_collate = "en_US.UTF-8",
      lc_type    = "en_US.UTF-8",
    }
  ]
  users = [
    {
      name        = "owner"
      conn_limit  = 35
      permissions = [{ "database_name" = "example" }]
      password = "ownerowner"
    },
     {
      name        = "useruser1"
      conn_limit  = 35
      permissions = [{ "database_name" = "example" }]
      password = "useruser1"
    }
  ]
  network_id  = var.network_id
  zone_a      = "ru-central1-a"
  zone_b      = "ru-central1-b"
  cidr_zone_a = ["10.3.1.0/24"]
  cidr_zone_b = ["10.3.2.0/24"]
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
      version = "0.71.0"
    }
  }
}