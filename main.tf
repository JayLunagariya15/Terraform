resource "azurerm_resource_group" "rgs" {
  name     = var.rg_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_storage_account" "storage" {
  count                    = var.st_account == "storagejay" ? 1 : 0
  name                     = var.st_account
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = merge(local.common_tags, local.advanced_tags)

}
