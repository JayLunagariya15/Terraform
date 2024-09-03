resource "azurerm_resource_group" "Petroleum-rg" {
  for_each = var.Petroleum-rg
  name     = each.value.name
  location = each.value.location
}
