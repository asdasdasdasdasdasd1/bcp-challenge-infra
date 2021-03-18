
# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "myPublicIP"
    location                     = azurerm_resource_group.rgbcp.location
    resource_group_name          = azurerm_resource_group.rgbcp.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "Terraform Demo"
    }
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.rgbcp.location
  resource_group_name = azurerm_resource_group.rgbcp.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.rgbcp.name
  location            = azurerm_resource_group.rgbcp.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"

  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  #admin_ssh_key {
  #  username   = "adminuser"
  #  public_key = file("~/.ssh/id_rsa.pub")
  #}

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}