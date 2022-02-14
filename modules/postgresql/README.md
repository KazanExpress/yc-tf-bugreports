## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1 |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.65 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_password.user_passwords](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [yandex_mdb_postgresql_cluster.cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_postgresql_cluster) | resource |
| [yandex_vpc_subnet.a](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.b](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_zone_a"></a> [cidr\_zone\_a](#input\_cidr\_zone\_a) | The name of the network, to which the PostgreSQL cluster belongs. | `list(string)` | n/a | yes |
| <a name="input_cidr_zone_b"></a> [cidr\_zone\_b](#input\_cidr\_zone\_b) | The name of the network, to which the PostgreSQL cluster belongs. | `list(string)` | n/a | yes |
| <a name="input_database_password_length"></a> [database\_password\_length](#input\_database\_password\_length) | The database password length. | `number` | `16` | no |
| <a name="input_databases"></a> [databases](#input\_databases) | List of databases. | <pre>list(object({<br>    name  = string<br>    owner = string<br>    extensions = list(object({<br>      name = string<br>    }))<br>    lc_collate = string<br>    lc_type    = string<br>  }))</pre> | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Inhibits deletion of the cluster | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the PostgreSQL cluster. | `string` | `"Multi-Node PostgreSQL."` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Volume of the storage available to a PostgreSQL host, in gigabytes. | `number` | `10` | no |
| <a name="input_disk_type_id"></a> [disk\_type\_id](#input\_disk\_type\_id) | Type of the storage of PostgreSQL hosts. | `string` | `"network-hdd"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment of the PostgreSQL cluster. | `string` | `"PRODUCTION"` | no |
| <a name="input_log_min_duration_statement"></a> [log\_min\_duration\_statement](#input\_log\_min\_duration\_statement) | Minimum statement duration to log. | `number` | `-1` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the PostgreSQL cluster. | `string` | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | The name of the network, to which the PostgreSQL cluster belongs. | `string` | n/a | yes |
| <a name="input_postgres_version"></a> [postgres\_version](#input\_postgres\_version) | PostgreSQL version. | `number` | `12` | no |
| <a name="input_resource_preset_id"></a> [resource\_preset\_id](#input\_resource\_preset\_id) | The ID of the preset for computational resources available to a PostgreSQL host. | `string` | `"s3-c2-m8"` | no |
| <a name="input_users"></a> [users](#input\_users) | List of users. | <pre>list(object({<br>    name       = string<br>    conn_limit = number<br>    permissions = list(object({<br>      database_name = string<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_yc_zone"></a> [yc\_zone](#input\_yc\_zone) | Yandex cloud zone to deploy database. | `string` | `"ru-central1-a"` | no |
| <a name="input_zone_a"></a> [zone\_a](#input\_zone\_a) | The name of the network, to which the PostgreSQL cluster belongs. | `string` | n/a | yes |
| <a name="input_zone_b"></a> [zone\_b](#input\_zone\_b) | The name of the network, to which the PostgreSQL cluster belongs. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_host"></a> [host](#output\_host) | The database host. |
| <a name="output_user_passwords"></a> [user\_passwords](#output\_user\_passwords) | The user passwords. |
