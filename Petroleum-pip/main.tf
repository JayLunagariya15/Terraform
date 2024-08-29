resource "azurerm_public_ip" "Petroleum_pip" {
  for_each = var.Petroleum-pips
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
}