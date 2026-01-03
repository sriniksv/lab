resource "azurerm_resource_group" "arg" {
  name = "example"
  location = "west europe"
}

resource "azurerm_storage_account" "arg" {
  name = "storageaccount12345"
  resource_group_name = azurerm_resource_group.arg.name
  location = azurerm_resource_group.arg.location
  account_tier = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "production"
  }
}
