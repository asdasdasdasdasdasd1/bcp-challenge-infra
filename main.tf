provider "azurerm" {
  version = "=2.5.0"
  subscription_id = ""
  tenant_id       = ""
  features {}
}

resource "azurerm_resource_group" "rgbcp" {
  name     = "rgbcp"
  location = "eastus"
}
