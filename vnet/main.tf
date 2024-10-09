
resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space

 dynamic "subnet" {
  for_each = each.value.subnets
  content {
    name             = subnet.value.snetname
    address_prefixes = subnet.value.address_prefixes
  }
}

}
