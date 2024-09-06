resource "azurerm_resource_group" "Petroleum_rg" {
  for_each = var.Petroleum_rg
  name     = each.value.name
  location = each.value.location
}
