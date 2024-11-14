resource "azurerm_resource_group" "k8s-rg" {
  for_each = var.k8s-rg
  name     = each.value.resource_group_name
  location = each.value.location
}
