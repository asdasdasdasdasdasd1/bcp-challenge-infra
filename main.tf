provider "azurerm" {
  version = "=2.5.0"
  subscription_id = "ec82af24-731a-4277-a043-b225234d5dbf"
  tenant_id       = "cb73b7e8-bc59-4114-ac71-9ac0b5314866"
  features {}
}

resource "azurerm_resource_group" "rgbcp" {
  name     = "rgbcp"
  location = "eastus"
}
