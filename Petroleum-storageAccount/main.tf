
resource "azurerm_storage_account" "Petroleum-sa" {
  for_each = var.Petroleum-storage-account
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


