
########SUBNET 1
resource "azurerm_subnet" "subnet" {
  name                 = "internal"
  address_prefix       = "172.16.1.0/24"
  resource_group_name  = azurerm_resource_group.rgbcp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}
