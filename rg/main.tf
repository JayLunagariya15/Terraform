resource "azurerm_resource_group" "rg-block" {
  for_each = var.rg-block
  name = each.value.resource_group_name
  location = each.value.location
}