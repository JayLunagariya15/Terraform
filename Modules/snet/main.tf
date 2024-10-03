resource "azurerm_subnet" "snet-block" {
  for_each             = var.snet-block
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}


resource "azurerm_network_security_group" "nsg-block" {
  name                = "nsg-block"
  location            = "BrazilSouth"
  resource_group_name = "todo-rg-jay"

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


resource "azurerm_subnet_network_security_group_association" "snet-nsg-association" {
  for_each = var.snet-block
  subnet_id                 = azurerm_subnet.snet-block[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg-block.id
}
