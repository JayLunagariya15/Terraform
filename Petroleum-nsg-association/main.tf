
resource "azurerm_network_interface_security_group_association" "Petroleum_association" {
  for_each = var.Petroleum-nsg-associations
  network_interface_id = data.azurerm_network_interface.nic-data[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg-data[each.key].id 
}