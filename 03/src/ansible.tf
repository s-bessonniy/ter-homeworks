resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",
    {
      webservers = yandex_compute_instance.vm
      databases  = yandex_compute_instance.datebase_vm
      storage    = [yandex_compute_instance.storage_server]
    }
  )
  filename = "${abspath(path.module)}/hosts.cfg"
}