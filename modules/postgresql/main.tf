resource "yandex_mdb_postgresql_cluster" "cluster" {
  name        = var.name
  description = var.description

  environment = var.environment
  network_id  = data.yandex_vpc_network.network.id

  config {
    version = var.postgres_version
    resources {
      disk_size          = var.disk_size
      disk_type_id       = var.disk_type_id
      resource_preset_id = var.resource_preset_id
    }
  }

  dynamic "database" {
    for_each = var.database_config_values
    content {
      name  = database.value.database
      owner = database.value.username
      dynamic "extension" {
        for_each = database.value.extensions
        content {
          name = extension.value
        }
      }
    }
  }

  dynamic "user" {
    for_each = var.database_config_values
    content {
      name       = user.value.username
      password   = random_password.password[user.key].result
      conn_limit = user.value.conn_limit
      permission {
        database_name = user.value.database
      }
      settings = {
        log_min_duration_statement = var.log_min_duration_statement
      }
    }
  }

  host {
    zone      = var.yc_zone
    subnet_id = data.yandex_vpc_subnet.subnet.id
  }
}

resource "random_password" "password" {
  count   = length(var.database_config_values)
  length  = var.database_password_length
  special = false
}
