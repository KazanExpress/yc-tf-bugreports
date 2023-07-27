data "yandex_compute_image" "base_image" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "test" {
  name        = "test-12345"
  hostname    = "test-12345"
  platform_id = "standard-v3"
  zone        = "ru-central1-b"
  allow_stopping_for_update = true

  resources {
    cores         = 2
    memory        = 8
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.base_image.id
      size     = 200
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.b.id
    security_group_ids = []
  }
}

resource "yandex_vpc_subnet" "b" {
  # folder_id      = var.folder_id
  zone           = "ru-central1-b"
  network_id     = var.network_id
  v4_cidr_blocks = ["10.167.0.0/16"]
}