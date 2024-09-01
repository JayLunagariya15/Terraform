data "azurerm_subnet" "Petroleum_bastion_snet_data" {
  for_each             = var.Petroleum_bastion
  name                 = "AzureBastionSubnet"
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
