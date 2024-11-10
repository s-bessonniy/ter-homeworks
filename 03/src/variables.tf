###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
  #default = ""
  #sensitive = true
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  #default = ""
  #sensitive = true
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  #default = ""
  #sensitive = true
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image_family"
}

variable "vm_resources" {
  type = map
  default = {
  cores = "2" 
  memory = "1"
  core_fraction = "20"
  }
}

variable "vms_ssh_root_key" {
  description = "metadata for all vms"
  type        = map(string)
  default     = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMIgCTAknACY9siTMrK+ozJsJoFis+9ePIUyAC8YYd/K s_yaremko@Ubuntu-50Gb"
  }
}

variable "vm_datebase" {
  type = list(object({
    vm_name       = string
    cpu           = number
    ram           = number
    core_fraction = number
    disk_size     = number
  }))
  default = [
    {
      vm_name       = "main"
      cpu           = 2
      ram           = 1
      core_fraction = 20
      disk_size     = 10  
    },
    { vm_name       = "replica"
      cpu           = 2
      ram           = 1
      core_fraction = 20
      disk_size     = 20
    }

  ]

}
