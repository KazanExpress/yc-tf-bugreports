output "host" {
  value       = yandex_mdb_postgresql_cluster.cluster.host[0].fqdn
  description = "The database host."
  sensitive   = true
}

output "password" {
  value = {
    for k, v in random_password.password : var.database_config_values[k].username => v.result
  }
  description = "The database password."
  sensitive   = true
}
