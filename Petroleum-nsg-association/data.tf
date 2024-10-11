data "azurerm_network_interface" "nic-data" {
  for_each = var.Petroleum-nsg-associations
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_security_group" "nsg-data" {
  for_each = var.Petroleum-nsg-associations
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}