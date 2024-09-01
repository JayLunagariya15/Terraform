resource "azurerm_public_ip" "Petroleum_bastion_pip" {
  for_each            = var.Petroleum_bastion
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "Petroleum_bastion" {
  for_each            = var.Petroleum_bastion
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.Petroleum_bastion_snet_data[each.key].id
    public_ip_address_id = azurerm_public_ip.Petroleum_bastion_pip[each.key].id
  }
}
