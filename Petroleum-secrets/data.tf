data "azurerm_key_vault" "Petroleum_kv" {
  for_each            = var.Petroleum_secret
  name                = each.value.data_name
  resource_group_name = each.value.resource_group_name
}
