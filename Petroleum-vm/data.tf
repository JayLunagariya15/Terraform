data "azurerm_network_interface" "Petroleum_nic_data" {
  for_each = var.Petroleum_vm_nic_data
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}

# data "azurerm_key_vault" "Petroleum_kv_data" {
#   name                = "munna-raja"
#   resource_group_name = "Petroleum-rg-Jay"
# }

# data "azurerm_key_vault_secret" "Petroleum_secret_username_data" {
#   name = "username"
#   key_vault_id = data.azurerm_key_vault.Petroleum_kv_data.id
# }

# data "azurerm_key_vault_secret" "Petroleum_secret_password_data" {
#   name = "password"
#   key_vault_id = data.azurerm_key_vault.Petroleum_kv_data.id
# }
