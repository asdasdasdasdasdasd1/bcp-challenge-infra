
resource "azurerm_storage_account" "BCP-DEV" {
  name                = "bcpdevbrian"
  resource_group_name = azurerm_resource_group.rgbcp.name
  location            = azurerm_resource_group.rgbcp.location
  account_tier             = "Standard" #Perfomance
  account_kind             = "StorageV2"
  account_replication_type = "LRS" #Replication
  access_tier              = "Hot"
  static_website {
    index_document     = "index.html"
    error_404_document = "error.html"
  }
  tags = {
    environment = "des"
  }
}