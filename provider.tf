terraform {
    required_providers {
      azurerm ={
        source = "hashicorp/azurerm"
        version = "4.6.0"
      }
    } 
}

provider "azurerm" {
  features {}
  subscription_id = "00000000-0000-0000-0000-000000000000"
}