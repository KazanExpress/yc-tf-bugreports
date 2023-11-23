resource "yandex_mdb_clickhouse_cluster" "yc-bug-cluster" {
  name        = "yc-bug-cluster"
  environment = "PRESTABLE"
  network_id  = var.network_id
  folder_id   = var.yc_folder_id
  version     = "23.8"

  clickhouse {
    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = 10
    }

    config {
      log_level                       = "TRACE"
      max_connections                 = 100
      max_concurrent_queries          = 50
      keep_alive_timeout              = 3000
      uncompressed_cache_size         = 8589934592
      mark_cache_size                 = 5368709120
      max_table_size_to_drop          = 53687091200
      max_partition_size_to_drop      = 53687091200
      timezone                        = "UTC"
      geobase_uri                     = ""
      query_log_retention_size        = 1073741824
      query_log_retention_time        = 2592000
      query_thread_log_enabled        = true
      query_thread_log_retention_size = 536870912
      query_thread_log_retention_time = 2592000
      part_log_retention_size         = 536870912
      part_log_retention_time         = 2592000
      metric_log_enabled              = true
      metric_log_retention_size       = 536870912
      metric_log_retention_time       = 2592000
      trace_log_enabled               = true
      trace_log_retention_size        = 536870912
      trace_log_retention_time        = 2592000
      text_log_enabled                = true
      text_log_retention_size         = 536870912
      text_log_retention_time         = 2592000
      text_log_level                  = "TRACE"
      background_pool_size            = 16
      background_schedule_pool_size   = 16

      merge_tree {
        replicated_deduplication_window                           = 100
        replicated_deduplication_window_seconds                   = 604800
        parts_to_delay_insert                                     = 150
        parts_to_throw_insert                                     = 300
        max_replicated_merges_in_queue                            = 16
        number_of_free_entries_in_pool_to_lower_max_size_of_merge = 8
        max_bytes_to_merge_at_min_space_in_pool                   = 1048576
      }

      compression {
        method              = "LZ4"
        min_part_size       = 1024
        min_part_size_ratio = 0.5
      }

      compression {
        method              = "ZSTD"
        min_part_size       = 2048
        min_part_size_ratio = 0.7
      }
    }
  }

  database {
    name = "test_db_name"
  }

  user {
    name     = "user1"
    password = "your_password222233"
    permission {
      database_name = "test_db_name"
    }
  }

  host {
    type      = "CLICKHOUSE"
    zone      = "ru-central1-b"
    subnet_id = var.subnet_id
  }

  cloud_storage {
    enabled = false
  }

  maintenance_window {
    type = "ANYTIME"
  }
}