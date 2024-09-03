terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Petroleum-rg" 
    storage_account_name = "petroleumsa"                   
    container_name       = "petroleumsc"                     
    key                  = "prod.terraform.tfstate"       
  }
}

provider "azurerm" {
  features {}
  subscription_id = "f528c591-fe1e-4c79-a199-3dc70d54270b"
}
