data "azurerm_network_interface" "Petroleum_nic_data" {
  for_each            = var.Petroleum_vm
  name                = each.value.nic_data_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "Petroleum_kv_data" {
  for_each            = var.Petroleum_vm
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  for_each     = var.Petroleum_vm
  name         = each.value.secret_name1
  key_vault_id = data.azurerm_key_vault.Petroleum_kv_data[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each     = var.Petroleum_vm
  name         = each.value.secret_name2
  key_vault_id = data.azurerm_key_vault.Petroleum_kv_data[each.key].id
}
