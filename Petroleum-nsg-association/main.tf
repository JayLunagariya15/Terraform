
resource "azurerm_network_interface_security_group_association" "Petroleum_association" {
  for_each = var.Petroleum-nsg-associations
  network_interface_id = each.value.network_interface_id
  network_security_group_id = each.value.network_security_group_id
}