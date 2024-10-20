resource "azurerm_resource_group" "name" {
  name     = var.rg_name
  location = var.location
  tags     = local.advanced_tags
}
