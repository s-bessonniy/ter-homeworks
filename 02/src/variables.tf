###cloud vars


variable "cloud_id" {
  type        = string
  default = "b1gb2n5l38p0333ckhtn"
}

variable "folder_id" {
  type        = string
  default = "b1gp8dbdn422t8kjgdka"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "default_zone_a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr_a" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


variable "subnet_a_name" {
  type = string
  default = "develop-ru-central1-a"
}

variable "subnet_b_name" {
  type = string
  default = "develop-ru-central1-b"
}


###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMIgCTAknACY9siTMrK+ozJsJoFis+9ePIUyAC8YYd/K s_yaremko@Ubuntu-50Gb"
#  description = "ssh-keygen -t ed25519"
#}
