#Create 2 vm
data "yandex_compute_image" "ubuntu" {
  family = var.vm_image_family
}

resource "yandex_compute_instance" "vm" {
  name        = "web-${count.index + 1}"
  platform_id = "standard-v3"
  metadata    = var.vms_ssh_root_key
  count = 2

  resources {
    cores  = var.vm_resources.cores
    memory = var.vm_resources.memory
    core_fraction = var.vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
}