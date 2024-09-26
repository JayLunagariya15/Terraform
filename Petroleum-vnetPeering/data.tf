data "azurerm_virtual_network" "Petroleum_peering_data" {
  for_each = var.Petroleum_peering
  name                = each.value.remote_virtual_network_name
  resource_group_name = each.value.remote_resource_group_name
}
