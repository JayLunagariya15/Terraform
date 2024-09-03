resource "azurerm_storage_container" "Petroleum-sc" {
  for_each = var.Petroleum-storage-container
  name                  = each.value.name
  storage_account_name  = each.value.storage_account_name
  container_access_type = "private"
}