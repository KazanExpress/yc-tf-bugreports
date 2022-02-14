resource "yandex_mdb_postgresql_cluster" "cluster" {
  name                = var.name
  description         = var.description
  deletion_protection = var.deletion_protection

  environment = var.environment
  network_id  = var.network_id

  config {
    version = var.postgres_version
    resources {
      disk_size          = var.disk_size
      disk_type_id       = var.disk_type_id
      resource_preset_id = var.resource_preset_id
    }
  }

  dynamic "database" {
    for_each = var.databases
    content {
      name  = database.value.name
      owner = database.value.owner
      dynamic "extension" {
        for_each = database.value.extensions
        content {
          name = extension.value.name
        }
      }
      lc_collate = database.value.lc_collate
      lc_type    = database.value.lc_type
    }
  }

  dynamic "user" {
    for_each = var.users
    content {
      name       = user.value.name
      password   = user.value.password
      conn_limit = user.value.conn_limit

      dynamic "permission" {
        for_each = user.value.permissions
        content {
          database_name = permission.value.database_name
        }
      }

      settings = {
        log_min_duration_statement = var.log_min_duration_statement
      }
    }
  }

  host {
    zone      = var.zone_a
    subnet_id = yandex_vpc_subnet.a.id
  }
  host {
    zone      = var.zone_b
    subnet_id = yandex_vpc_subnet.b.id
  }
}

resource "random_password" "user_passwords" {
  count  = length(var.users)
  length = var.database_password_length
}

resource "yandex_vpc_subnet" "a" {
  # folder_id      = var.folder_id
  zone           = var.zone_a
  network_id     = var.network_id
  v4_cidr_blocks = var.cidr_zone_a
}

resource "yandex_vpc_subnet" "b" {
  # folder_id      = var.folder_id
  zone           = var.zone_b
  network_id     = var.network_id
  v4_cidr_blocks = var.cidr_zone_b
}
