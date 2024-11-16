resource "yandex_compute_disk" "default_disk" {
  count      = var.disk_resources.count
  name       = "${var.disk_names}-${count.index + 1}"
  type       = var.disk_resources.type
  zone       = var.default_zone
  size       = var.disk_resources.size
  block_size = var.disk_resources.block_size
}

resource "yandex_compute_instance" "storage_server" {

    depends_on = [yandex_compute_disk.default_disk]

  name        = var.server_disk_names
  platform_id = var.vm_resources.platform_id

  resources {
    cores         = var.vm_resources.cores
    memory        = var.vm_resources.memory
    core_fraction = var.vm_resources.core_fraction
  }

boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = toset(yandex_compute_disk.default_disk[*].id)
    content {
      disk_id     = secondary_disk.key
      auto_delete = var.vm_def
    }
  }

metadata = var.vms_ssh_root_key

scheduling_policy {
    preemptible = var.vm_def
  }

   network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_def
  }

 allow_stopping_for_update = var.vm_def

}
