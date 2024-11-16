#Create 2 vm database
data "yandex_compute_image" "ubuntu_database" {
  family = var.vm_image_family
}

resource "yandex_compute_instance""datebase_vm" {
  for_each = {
    for key,value in var.vm_datebase:
    key => value
  }

  name        = each.value.vm_name
  platform_id = var.vm_resources.platform_id
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }


boot_disk {
  initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk_size
    }
}  

scheduling_policy {
  preemptible = var.vm_def
  }
network_interface {
  subnet_id = yandex_vpc_subnet.develop.id
  security_group_ids = [yandex_vpc_security_group.example.id]
  nat       = var.vm_def
}

metadata = var.vms_ssh_root_key

 depends_on = [
    yandex_compute_instance.vm
  ]

}
