data "azurerm_subnet" "Petroleum_snet_data" {
  for_each = var.Petroleum-nics-sub-data
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_network_interface" "Petroleum_nic" {
  for_each            = var.Petroleum-nics
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  ip_configuration {
    name                          = each.value.ip_configuration.name
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    subnet_id                     = data.azurerm_subnet.Petroleum_snet_data[each.key].id

  }
}
