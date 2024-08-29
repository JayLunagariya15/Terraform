data "azurerm_subnet" "Petroleum_snet_data" {
  for_each = var.Petroleum-nics-sub-data
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "Petroleum_pip_data" {
  for_each = var.Petroleum-nics-pip-data
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
