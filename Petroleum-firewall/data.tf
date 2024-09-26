data "azurerm_subnet" "Petroleum_firewall_snet_data" {
  for_each = var.Petroleum_firewall
  name = each.value.firewall_snet_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}
data "azurerm_subnet" "Petroleum_snet_data" {
  for_each = var.Petroleum_firewall
  name = each.value.snet_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}