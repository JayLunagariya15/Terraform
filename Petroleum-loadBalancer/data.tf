data "azurerm_network_interface" "Petroleum_lb_nic_data" {
  for_each = var.Petroleum_lb_nic
  name = each.value.nic_data_name
  resource_group_name = each.value.resource_group_name
}