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
  features {

  }
  subscription_id = "26c915ac-fa33-4940-9882-ca0dcabd8edc"
}
