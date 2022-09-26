resource "yandex_mdb_postgresql_cluster" "cluster" {
  name                = "test-pg-4"

  environment = "PRODUCTION"
  network_id  = var.network_id
  deletion_protection = true

  config {
    version = 14
    resources {
      disk_size          = 30
      resource_preset_id = "s3-c2-m8"
      disk_type_id = "network-hdd"
    }
  }

  user {
    name = "test"
    password = "12341234"
  }

  database {
    name = "test"
    owner = "test"
  }

  host {
    zone      = "ru-central1-a"
    subnet_id = yandex_vpc_subnet.a.id
  }
}

resource "yandex_vpc_subnet" "a" {
  # folder_id      = var.folder_id
  zone           = "ru-central1-a"
  network_id     = var.network_id
  v4_cidr_blocks = ["10.166.0.0/16"]
}