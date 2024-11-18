#создаем облачную сеть
/*resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

#создаем подсеть
resource "yandex_vpc_subnet" "develop_a" {
  name           = "develop-${var.default_zone_a}"
  zone           = var.default_zone_a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_zone_a
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = "develop-${var.default_zone_b}"
  zone           = var.default_zone_b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_zone_b
}*/

module "vpc" {
  source            = "./vpc"
  env_name          = var.vpc_name
  zone              = var.default_zone_a
  v4_cidr_block     = var.default_cidr_zone_a
}


module "test_vm" {
  #source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  source         = "git::https://github.com/s-bessonniy/yandex_compute_instance.git?ref=main"
  env_name       = var.vm_marketing.env_name 
  #network_id     = yandex_vpc_network.develop.id
  network_id     = module.vpc.vpc_network.id
  subnet_zones   = [var.default_zone_a]
  subnet_ids     = [ module.vpc.vpc_subnet.id ]
  instance_name  = var.vm_marketing.instance_name
  instance_count = var.vm_marketing.instance_count
  image_family   = var.vm_marketing.image_family
  public_ip      = var.vm_marketing.public_ip

  labels = { 
    owner= var.vm_marketing.owner,
    project = var.vm_marketing.project
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "example-vm" {
  #source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  source         = "git::https://github.com/s-bessonniy/yandex_compute_instance.git?ref=main"
  env_name       = var.vm_analytics.env_name 
  #network_id     = yandex_vpc_network.develop.id
  network_id     = module.vpc.vpc_network.id
  subnet_zones   = [var.default_zone_a]
  subnet_ids     = [ module.vpc.vpc_subnet.id ]
  instance_name  = var.vm_analytics.instance_name
  instance_count = var.vm_analytics.instance_count
  image_family   = var.vm_analytics.image_family
  public_ip      = var.vm_analytics.public_ip

  labels = { 
    owner= var.vm_analytics.owner,
    project = var.vm_analytics.project
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    ssh_public_key = file(var.public_key)
    username       = var.username_init
  }

}
