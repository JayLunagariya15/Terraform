resource "azurerm_key_vault" "Petroleum_kv" {
  for_each                    = var.Petroleum_kv
  name                        = each.value.name
  resource_group_name         = each.value.resource_group_name
  location                    = each.value.location
  sku_name                    = each.value.sku_name
  tenant_id                   = data.azurerm_client_config.Petroleum_client_config.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enabled_for_disk_encryption = true

  access_policy {
    tenant_id = data.azurerm_client_config.Petroleum_client_config.tenant_id
    object_id = data.azurerm_client_config.Petroleum_client_config.object_id

    secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
  }
}
