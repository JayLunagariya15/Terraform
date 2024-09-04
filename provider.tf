terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  features {

  }
  subscription_id = "f528c591-fe1e-4c79-a199-3dc70d54270b"
}