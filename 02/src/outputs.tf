output "Create_VMs" {
  value = {
    VM1 = yandex_compute_instance.vm_web_platform.name
    external_ip_VM1 = yandex_compute_instance.vm_web_platform.network_interface.0.nat_ip_address
    VM2 = yandex_compute_instance.vm_db_platform.name
    external_ip_VM2 = yandex_compute_instance.vm_db_platform.network_interface.0.nat_ip_address
  }
}
