resource "azurerm_cdn_endpoint" "CDN-DEV-ENDPOINT-BCP" {
  name                = "bcpdev"
  profile_name        = azurerm_cdn_profile.DEV-CDN-BCP.name
  location            = azurerm_resource_group.rgbcp.location  
  resource_group_name = azurerm_resource_group.rgbcp.name
  origin_host_header  = "bcpdev.z13.web.core.windows.net"
  origin {
    name      = "bcpdevorigin"
    host_name = "bcpdev.z13.web.core.windows.net"
  }
}