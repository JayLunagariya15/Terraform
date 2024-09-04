resource "azurerm_network_interface" "Petroleum_nic" {
  for_each = var.Petroleum_nic
  name = each.value.nic_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  
  ip_configuration {
    name = each.value.ipconfig_name
    subnet_id = data.azurerm_subnet.Petroleum_snet_data[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}   