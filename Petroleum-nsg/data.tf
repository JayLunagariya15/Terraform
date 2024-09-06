data "azurerm_network_interface" "Petroleum_nic_data" {
  for_each            = var.Petroleum_nsgs
  name                = each.value.nic_data_name
  resource_group_name = each.value.resource_group_name
}