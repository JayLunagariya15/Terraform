resource "azurerm_subnet" "k8s-snet" {
  for_each             = var.k8s-subnet
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefix
}
