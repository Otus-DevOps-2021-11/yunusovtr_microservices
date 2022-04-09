terraform {
  required_providers {
    yandex = {
      source = "terraform-registry.storage.yandexcloud.net/yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_compute_instance" "node" {
  count = var.instance_count

  name = "kube-node${count.index}"
  zone = var.vm_zone

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
      size     = 40
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.kube-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}

resource "yandex_vpc_network" "kube-network" {
  name = "kube-network"
}

resource "yandex_vpc_subnet" "kube-subnet" {
  name           = "kube-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.kube-network.id
  v4_cidr_blocks = [var.cidr]
}
