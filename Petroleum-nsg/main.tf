resource "azurerm_network_security_group" "Petroleum_nsg" {
  for_each            = var.Petroleum_nsgs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  security_rule {
    name                       = each.value.security_rule.name
    priority                   = each.value.security_rule.priority
    direction                  = each.value.security_rule.direction
    access                     = each.value.security_rule.access
    protocol                   = each.value.security_rule.protocol
    source_port_range          = each.value.security_rule.source_port_range
    destination_port_range     = each.value.security_rule.destination_port_range
    source_address_prefix      = each.value.security_rule.source_address_prefix
    destination_address_prefix = each.value.security_rule.destination_address_prefix
  }
}

resource "azurerm_network_interface_security_group_association" "Petroleum_association" {
  for_each = var.Petroleum_nsgs
  network_interface_id = data.azurerm_network_interface.Petroleum_nic_data[each.key].id
  network_security_group_id = azurerm_network_security_group.Petroleum_nsg[each.key].id
}