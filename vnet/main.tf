resource "azurerm_virtual_network" "k8s-vnet" {
    for_each = var.k8s-vnet
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}
