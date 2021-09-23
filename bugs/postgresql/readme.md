# PostgreSQL

The bug is that if `log_min_duration_seconds` is set to `-1` `terraform plan` will show that field changed even if it did not:

```hcl

~ settings   = {
    + "log_min_duration_statement" = "-1"
}
```

## Steps to reproduce

1. `terraform init`
2. Set `yc_*` vars with environment variables or `*.tfvars`
3. Run `terraform plan` and get:
```hcl
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.postgres.random_password.password[0] will be created
  + resource "random_password" "password" {
      + id          = (known after apply)
      + length      = 16
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = true
      + result      = (sensitive value)
      + special     = false
      + upper       = true
    }

  # module.postgres.random_password.password[1] will be created
  + resource "random_password" "password" {
      + id          = (known after apply)
      + length      = 16
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = true
      + result      = (sensitive value)
      + special     = false
      + upper       = true
    }

  # module.postgres.yandex_mdb_postgresql_cluster.cluster will be created
  + resource "yandex_mdb_postgresql_cluster" "cluster" {
      + created_at          = (known after apply)
      + deletion_protection = (known after apply)
      + description         = "PostgreSQL for demonstrating bug of terraform provider"
      + environment         = "PRODUCTION"
      + folder_id           = (known after apply)
      + health              = (known after apply)
      + host_master_name    = (known after apply)
      + id                  = (known after apply)
      + name                = "yc-bug-postgresql"
      + network_id          = "enphrvfu4e03hn3v8u48"
      + status              = (known after apply)

      + config {
          + autofailover      = (known after apply)
          + postgresql_config = (known after apply)
          + version           = "12"

          + access {
              + data_lens = (known after apply)
              + web_sql   = (known after apply)
            }

          + backup_window_start {
              + hours   = (known after apply)
              + minutes = (known after apply)
            }

          + performance_diagnostics {
              + enabled                      = (known after apply)
              + sessions_sampling_interval   = (known after apply)
              + statements_sampling_interval = (known after apply)
            }

          + resources {
              + disk_size          = 10
              + disk_type_id       = "network-hdd"
              + resource_preset_id = "s2.micro"
            }
        }

      + database {
          + lc_collate = "C"
          + lc_type    = "C"
          + name       = "dev"
          + owner      = "devUser"
        }
      + database {
          + lc_collate = "C"
          + lc_type    = "C"
          + name       = "prod"
          + owner      = "prodUser"
        }

      + host {
          + assign_public_ip   = false
          + fqdn               = (known after apply)
          + replication_source = (known after apply)
          + role               = (known after apply)
          + subnet_id          = "e9bi0hfdcolej3ib7p61"
          + zone               = "ru-central1-a"
        }

      + maintenance_window {
          + day  = (known after apply)
          + hour = (known after apply)
          + type = (known after apply)
        }

      + user {
          + conn_limit = 50
          + login      = true
          + name       = "devUser"
          + password   = (sensitive value)
          + settings   = {
              + "log_min_duration_statement" = "-1"
            }

          + permission {
              + database_name = "dev"
            }
        }
      + user {
          + conn_limit = 35
          + login      = true
          + name       = "prodUser"
          + password   = (sensitive value)
          + settings   = {
              + "log_min_duration_statement" = "-1"
            }

          + permission {
              + database_name = "prod"
            }
        }
    }

Plan: 3 to add, 0 to change, 0 to destroy.
```

4. Run `terraform apply`

```hcl

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.postgres.random_password.password[0] will be created
  + resource "random_password" "password" {
      + id          = (known after apply)
      + length      = 16
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = true
      + result      = (sensitive value)
      + special     = false
      + upper       = true
    }

  # module.postgres.random_password.password[1] will be created
  + resource "random_password" "password" {
      + id          = (known after apply)
      + length      = 16
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = true
      + result      = (sensitive value)
      + special     = false
      + upper       = true
    }

  # module.postgres.yandex_mdb_postgresql_cluster.cluster will be created
  + resource "yandex_mdb_postgresql_cluster" "cluster" {
      + created_at          = (known after apply)
      + deletion_protection = (known after apply)
      + description         = "PostgreSQL for demonstrating bug of terraform provider"
      + environment         = "PRODUCTION"
      + folder_id           = (known after apply)
      + health              = (known after apply)
      + host_master_name    = (known after apply)
      + id                  = (known after apply)
      + name                = "yc-bug-postgresql"
      + network_id          = "enphrvfu4e03hn3v8u48"
      + status              = (known after apply)

      + config {
          + autofailover      = (known after apply)
          + postgresql_config = (known after apply)
          + version           = "12"

          + access {
              + data_lens = (known after apply)
              + web_sql   = (known after apply)
            }

          + backup_window_start {
              + hours   = (known after apply)
              + minutes = (known after apply)
            }

          + performance_diagnostics {
              + enabled                      = (known after apply)
              + sessions_sampling_interval   = (known after apply)
              + statements_sampling_interval = (known after apply)
            }

          + resources {
              + disk_size          = 10
              + disk_type_id       = "network-hdd"
              + resource_preset_id = "s2.micro"
            }
        }

      + database {
          + lc_collate = "C"
          + lc_type    = "C"
          + name       = "dev"
          + owner      = "devUser"
        }
      + database {
          + lc_collate = "C"
          + lc_type    = "C"
          + name       = "prod"
          + owner      = "prodUser"
        }

      + host {
          + assign_public_ip   = false
          + fqdn               = (known after apply)
          + replication_source = (known after apply)
          + role               = (known after apply)
          + subnet_id          = "e9bi0hfdcolej3ib7p61"
          + zone               = "ru-central1-a"
        }

      + maintenance_window {
          + day  = (known after apply)
          + hour = (known after apply)
          + type = (known after apply)
        }

      + user {
          + conn_limit = 50
          + login      = true
          + name       = "devUser"
          + password   = (sensitive value)
          + settings   = {
              + "log_min_duration_statement" = "-1"
            }

          + permission {
              + database_name = "dev"
            }
        }
      + user {
          + conn_limit = 35
          + login      = true
          + name       = "prodUser"
          + password   = (sensitive value)
          + settings   = {
              + "log_min_duration_statement" = "-1"
            }

          + permission {
              + database_name = "prod"
            }
        }
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.postgres.random_password.password[0]: Creating...
module.postgres.random_password.password[1]: Creating...
module.postgres.random_password.password[0]: Creation complete after 0s [id=none]
module.postgres.random_password.password[1]: Creation complete after 0s [id=none]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Creating...
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [10s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [20s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [30s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [40s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [50s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [1m0s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [1m10s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [1m20s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [1m30s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [1m40s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [1m50s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [2m0s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [2m10s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [2m20s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [2m30s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [2m40s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [2m50s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [3m0s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [3m10s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [3m20s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [3m30s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [3m40s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [3m50s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [4m0s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [4m10s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [4m20s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [4m30s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [4m40s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [4m50s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [5m0s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [5m10s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [5m20s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [5m30s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Still creating... [5m40s elapsed]
module.postgres.yandex_mdb_postgresql_cluster.cluster: Creation complete after 5m40s [id=c9qaeui8193n6fohdifn]
```

5. Run `terraform plan` again

```hcl
  # module.postgres.yandex_mdb_postgresql_cluster.cluster has been changed
  ~ resource "yandex_mdb_postgresql_cluster" "cluster" {
      ~ health              = "HEALTH_UNKNOWN" -> "ALIVE"
        id                  = "c9qaeui8193n6fohdifn"
      + labels              = {}
        name                = "yc-bug-postgresql"
      + security_group_ids  = []
        # (8 unchanged attributes hidden)





      ~ user {
          + grants     = []
            name       = "devUser"
            # (4 unchanged attributes hidden)

            # (1 unchanged block hidden)
        }
      ~ user {
          + grants     = []
            name       = "prodUser"
            # (4 unchanged attributes hidden)

            # (1 unchanged block hidden)
        }
        # (5 unchanged blocks hidden)
    }

Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or respond to these
changes.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # module.postgres.yandex_mdb_postgresql_cluster.cluster will be updated in-place
  ~ resource "yandex_mdb_postgresql_cluster" "cluster" {
        id                  = "c9qaeui8193n6fohdifn"
        name                = "yc-bug-postgresql"
        # (11 unchanged attributes hidden)





      ~ user {
            name       = "devUser"
          ~ settings   = {
              + "log_min_duration_statement" = "-1"
            }
            # (4 unchanged attributes hidden)

            # (1 unchanged block hidden)
        }
      ~ user {
            name       = "prodUser"
          ~ settings   = {
              + "log_min_duration_statement" = "-1"
            }
            # (4 unchanged attributes hidden)

            # (1 unchanged block hidden)
        }
        # (5 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```

