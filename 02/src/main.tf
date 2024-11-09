resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop_a" {
  name           = var.subnet_a_name
  zone           = var.default_zone_a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_a
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = var.subnet_b_name
  zone           = var.default_zone_b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_b
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}


resource "yandex_compute_instance" "vm_web_platform" {
  #name        = var.vm_web_name
  name        = local.vm_web_name
  platform_id = var.vm_web_platform_id
  zone        = var.vm_web_zone
  metadata    = var.vms_ssh_root_key   

  resources {
  #  cores         = var.vm_web_cores
    cores         = var.vms_resources.vm_web_resources.cores
  #  memory        = var.vm_web_memory
    memory        = var.vms_resources.vm_web_resources.memory
  #  core_fraction = var.vm_web_core_fraction
    core_fraction = var.vms_resources.vm_web_resources.core_fraction
    
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
    subnet_id = yandex_vpc_subnet.develop_a.id
    nat       = true
  }

#  metadata = {
#    serial-port-enable = 1
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"  
#  }
}


resource "yandex_compute_instance" "vm_db_platform" {
  #name        = var.vm_db_name
  name        = local.vm_db_name
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_zone
  metadata    = var.vms_ssh_root_key

  resources {
  #  cores         = var.vm_db_cores
    cores         = var.vms_resources.vm_db_resources.cores
  #  memory        = var.vm_db_memory
    memory        = var.vms_resources.vm_db_resources.memory
  #  core_fraction = var.vm_db_core_fraction
    core_fraction = var.vms_resources.vm_db_resources.core_fraction
    
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
    subnet_id = yandex_vpc_subnet.develop_b.id
    nat       = true
  }
  

#  metadata = {
#    serial-port-enable = 1
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
#  }

}
