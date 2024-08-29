resource "azurerm_network_interface" "Petroleum_nic" {
  for_each            = var.Petroleum-nics
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  ip_configuration {
    name                          = each.value.ip_configuration.name
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    subnet_id                     = data.azurerm_subnet.Petroleum_snet_data[each.value.subnet].id
    public_ip_address_id          = data.azurerm_public_ip.Petroleum_pip_data[each.value.public].id
  }
}

# public_ip_address_id          = each.value.ip_configuration.public_ip_address_id
# subnet_id                     = each.value.ip_configuration.subnet_id
