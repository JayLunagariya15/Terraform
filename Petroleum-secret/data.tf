data "azurerm_key_vault" "Petroleum_secret_data" {
  for_each            = var.Petroleum_secret
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}
