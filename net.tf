
resource "azurerm_virtual_network" "vnet" {
  name                = "vNet"
  address_space       = ["172.16.0.0/16"]
  location            = azurerm_resource_group.rgbcp.location
  resource_group_name = azurerm_resource_group.rgbcp.name
}