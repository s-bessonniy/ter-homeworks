###vm_web

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image_family"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "yandex_compute_name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "yandex_compute_platform_id"
}

variable "vms_resources" {
  description = "Resources for all vms"
  type        = map(map(number))
  default     = {
    vm_web_resources = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
    vm_db_resources = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
  }
}

#variable "vm_web_cores" {
#  type        = string
#  default     = "2"
#  description = "yandex_compute_cores"
#}

#variable "vm_web_memory" {
#  type        = string
#  default     = "1"
#  description = "yandex_compute_memory"
#}

#variable "vm_web_core_fraction" {
#  type        = string
#  default     = "20"
#  description = "yandex_compute_core_fraction"
#}

variable "vm_web_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "yandex_compute_core_fraction"
}

###vm_db

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image_family"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "yandex_compute_name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "yandex_compute_platform_id"
}

#variable "vm_db_cores" {
#  type        = string
#  default     = "2"
#  description = "yandex_compute_cores"
#}

#variable "vm_db_memory" {
#  type        = string
#  default     = "1"
#  description = "yandex_compute_memory"
#}

#variable "vm_db_core_fraction" {
#  type        = string
#  default     = "20"
#  description = "yandex_compute_core_fraction"
#}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "yandex_compute_core_fraction"
}

variable "vms_ssh_root_key" {
  description = "metadata for all vms"
  type        = map(string)
  default     = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMIgCTAknACY9siTMrK+ozJsJoFis+9ePIUyAC8YYd/K s_yaremko@Ubuntu-50Gb"
  }
}
