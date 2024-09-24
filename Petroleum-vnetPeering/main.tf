resource "azurerm_virtual_network_peering" "Petroleum_peering" {
  for_each                     = var.Petroleum_peering
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  virtual_network_name         = each.value.virtual_network_name
  remote_virtual_network_id    = data.azurerm_virtual_network.Petroleum_peering_data[each.key].id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}
