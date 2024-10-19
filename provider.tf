terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
 subscription_id = "00000000-0000-0000-0000-000000000000"
  features {

  }
}
