terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
   features {}
  subscription_id = "ac30d9b8-34e5-4948-80d1-d9c571735ea3"
}