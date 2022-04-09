
resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tftpl",
    {
      node_external_ips = yandex_compute_instance.node.*.network_interface.0.nat_ip_address,
      node_local_ips    = yandex_compute_instance.node.*.network_interface.0.ip_address,
      cidr              = var.cidr
    }
  )
  filename = "../ansible/inventory"
}

output "external_ip_address_node" {
  value = yandex_compute_instance.node.*.network_interface.0.nat_ip_address
}
