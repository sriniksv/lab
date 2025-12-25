resource "azure_resource_group" "arg" {
  name = "storage_group"
  location = "west europe"
}

resource "azure_storage_account" "asa" {
  name = "storage_account"
  resource_group_name = azure_resource_group.arg.name
  location = azure_resource_group.arg.location
  account_tire = "standard"
  account_replication_type = "LRS"

  tags {
    environment = "development"
  }
}

