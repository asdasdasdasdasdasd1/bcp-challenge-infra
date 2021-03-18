resource "azurerm_cdn_profile" "DEV-CDN-BCP" {
  name                = "bcpdevprofile"
  location            = azurerm_resource_group.rgbcp.location
  resource_group_name = azurerm_resource_group.rgbcp.name
  sku                 = "Standard_Microsoft"
  tags = {
    environment = "Development"
    #cost_center = "MSFT"
  }
}