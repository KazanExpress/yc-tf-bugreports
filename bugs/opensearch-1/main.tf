locals {
  zone_id = "ru-central1-a"
}

resource "yandex_mdb_opensearch_cluster" "opensearch" {
  environment        = "PRODUCTION"
  name               = "test"
  description        = "Testing cluster for tf"
  folder_id          = var.yc_folder_id
  network_id         = var.network_id
  security_group_ids = []

  deletion_protection = false

  config {
    version        = "2.8"
    admin_password = "password"

    opensearch {
      node_groups {
        name             = "opensearch-nodes"
        assign_public_ip = false
        hosts_count      = 3
        zone_ids         = [local.zone_id]
        subnet_ids       = [yandex_vpc_subnet.a.id]
        roles            = ["data", "manager"]
        resources {
          resource_preset_id = "s3-c2-m8"
          disk_size = 53687091200
          disk_type_id = "network-ssd"
        }
      }
      plugins = []
    }

    dashboards {
      node_groups {
        name = "opensearch-dahboards"
        assign_public_ip = false
        hosts_count = 1
        zone_ids = [local.zone_id]
        subnet_ids = [yandex_vpc_subnet.a.id]
        resources {
          resource_preset_id = "s3-c2-m8"
          disk_size = 53687091200
          disk_type_id = "network-ssd"
        }
      }
    }
  }
}

resource "yandex_vpc_subnet" "a" {
  folder_id      = var.yc_folder_id
  zone           = local.zone_id
  network_id     = var.network_id
  v4_cidr_blocks = ["10.167.0.0/16"]
}
