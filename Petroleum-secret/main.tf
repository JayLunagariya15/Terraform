resource "azurerm_key_vault_secret" "Petroleum_secret" {
  for_each     = var.Petroleum_secret
  name         = each.value.secret_name
  value        = each.value.secret_value
  key_vault_id = data.azurerm_key_vault.Petroleum_secret_data[each.key].id
}