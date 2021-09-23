data "yandex_vpc_network" "network" {
  name = var.network_name
}

data "yandex_vpc_subnet" "subnet" {
  name = var.subnet_name
}
