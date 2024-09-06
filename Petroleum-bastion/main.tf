resource "azurerm_bastion_host" "Petroleum_bastion" {
  for_each            = var.Petroleum_bastion
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  ip_configuration {
    name                 = each.value.ipconfig_name
    subnet_id            = data.azurerm_subnet.Petroleum_snet_data[each.key].id
    public_ip_address_id = azurerm_public_ip.Petroleum_bastion_pip[each.key].id
  }
}


resource "azurerm_public_ip" "Petroleum_bastion_pip" {
  for_each            = var.Petroleum_bastion
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
  sku                 = "Standard"
}
