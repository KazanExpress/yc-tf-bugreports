

resource "yandex_mdb_postgresql_user" "bob" {
  cluster_id = var.cluster_id
  name       = "bob-test"
  password   = "password"

  login = false
  conn_limit = 0

  permission {
    database_name = var.db_name
  }
}
