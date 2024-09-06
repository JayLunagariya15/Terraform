data "azurerm_subnet" "Petroleum_snet_data" {
  for_each             = var.Petroleum_bastion
  name                 = "AzureBastionSubnet"
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}
