output "host" {
  value       = "c-${yandex_mdb_postgresql_cluster.cluster.id}.rw.mdb.yandexcloud.net"
  description = "The database host."
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
