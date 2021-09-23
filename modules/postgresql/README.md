# Single Node PostgreSQL

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.61 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1 |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.61 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [yandex_mdb_postgresql_cluster.postgres_cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_postgresql_cluster) | resource |
| [yandex_vpc_network.network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/vpc_network) | data source |
| [yandex_vpc_subnet.subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/vpc_subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The database name. | `string` | n/a | yes |
| <a name="input_database_password_length"></a> [database\_password\_length](#input\_database\_password\_length) | The database password length. | `number` | `16` | no |
| <a name="input_database_username"></a> [database\_username](#input\_database\_username) | The database username. | `string` | `"owner"` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the PostgreSQL cluster. | `string` | `"Single Node PostgreSQL."` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Volume of the storage available to a PostgreSQL host, in gigabytes. | `number` | `10` | no |
| <a name="input_disk_type_id"></a> [disk\_type\_id](#input\_disk\_type\_id) | Type of the storage of PostgreSQL hosts. | `string` | `"network-hdd"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment of the PostgreSQL cluster. | `string` | `"PRODUCTION"` | no |
| <a name="input_log_min_duration_statement"></a> [log\_min\_duration\_statement](#input\_log\_min\_duration\_statement) | Minimum statement duration to log. | `number` | `-1` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the PostgreSQL cluster. | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the network, to which the PostgreSQL cluster belongs. | `string` | `"default"` | no |
| <a name="input_postgres_version"></a> [postgres\_version](#input\_postgres\_version) | PostgreSQL version. | `number` | `12` | no |
| <a name="input_resource_preset_id"></a> [resource\_preset\_id](#input\_resource\_preset\_id) | The ID of the preset for computational resources available to a PostgreSQL host. | `string` | `"b2.micro"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the subnet, to which the PostgreSQL cluster belongs. | `string` | `"default-ru-central1-a"` | no |
| <a name="input_yc_zone"></a> [yc\_zone](#input\_yc\_zone) | Yandex cloud zone to deploy database. | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_host"></a> [host](#output\_host) | The database host. |
| <a name="output_password"></a> [password](#output\_password) | The database password. |
