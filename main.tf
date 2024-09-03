resource "azurerm_resource_group" "Petroleum-rg" {
  name = "Petroleum-rg"
  location = "France Central"
}

resource "azurerm_storage_account" "Petroleum-sa" {
  name = "petroleumsa"
  resource_group_name = azurerm_resource_group.Petroleum-rg.name
  location = azurerm_resource_group.Petroleum-rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
} 

resource "azurerm_storage_container" "Petroleum-sc" {
  name = "petroleumsc"
  storage_account_name = azurerm_storage_account.Petroleum-sa.name
  container_access_type = "private"
}