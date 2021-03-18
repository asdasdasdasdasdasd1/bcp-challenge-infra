resource "azurerm_network_security_group" "nsg" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.rgbcp.location
  resource_group_name = azurerm_resource_group.rgbcp.name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Develop"
  }
}