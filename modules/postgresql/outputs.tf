output "host" {
  value       = "c-${yandex_mdb_postgresql_cluster.cluster.id}.rw.mdb.yandexcloud.net"
  description = "The database host."
}

output "user_passwords" {
  value = {
    for k, v in random_password.user_passwords : var.users[k].name => v.result
  }
  description = "The user passwords."
  sensitive   = true
}

output "cluster_id" {
  value       = yandex_mdb_postgresql_cluster.cluster.id
  description = "The cluster id"
  sensitive   = false
}

output "master_host" {
  value       = "c-${yandex_mdb_postgresql_cluster.cluster.id}.rw.mdb.yandexcloud.net"
  sensitive   = false
  description = "master host fqdn"
}
