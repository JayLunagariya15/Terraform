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
  subscription_id = "00000000-0000-0000-0000-000000000000"
}
