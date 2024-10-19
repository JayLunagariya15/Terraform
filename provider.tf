terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
}

provider "azurerm" {
  # Configuration 
  features {
    
  }
  subscription_id = "00000000-0000-0000-0000-000000000000"
}
