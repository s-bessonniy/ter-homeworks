###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
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
variable "default_cidr_zone_a" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_zone_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###common vars

variable "public_key" {
  type        = string
  default     = "~/.ssh/id_ed25519.pub"

}

variable "username_init" {
  type        = string
  default     = "ubuntu"

}

variable "vm_marketing" {
  type = object({
    env_name       = string
    instance_name  = string
    instance_count = number
    image_family   = string
    public_ip      = bool
    owner          = string
    project        = string
  })
  default = {
    env_name       = "develop-marketing"
    instance_name  = "web-marketing"
    instance_count = 1
    image_family   = "ubuntu-2004-lts"
    public_ip      = true
    owner          = "s_yaremko"
    project        = "marketing"
  }
}


variable "vm_analytics" {
  type = object({
    env_name       = string
    instance_name  = string
    instance_count = number
    image_family   = string
    public_ip      = bool
    owner          = string
    project        = string
  })
  default = {
    env_name       = "develop-analytics"
    instance_name  = "web-analytics"
    instance_count = 1
    image_family   = "ubuntu-2004-lts"
    public_ip      = true
    owner          = "s_yaremko"
    project        = "analytics"
  }
}

