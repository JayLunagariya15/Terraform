resource "azurerm_key_vault" "Petroleum_kv" {
  for_each                    = var.Petroleum-kvs
  name                        = each.value.name
  resource_group_name         = each.value.resource_group_name
  location                    = each.value.location
  tenant_id                   = data.azurerm_client_config.Petroleum_client_config_data.tenant_id
  sku_name                    = each.value.sku_name
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = false
  enabled_for_disk_encryption = true

  access_policy  {
    tenant_id         = data.azurerm_client_config.Petroleum_client_config_data.tenant_id
    object_id         = data.azurerm_client_config.Petroleum_client_config_data.object_id

    secret_permissions =["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
  }
}
