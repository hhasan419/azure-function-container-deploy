providers "azurerm" {
  feature {}
}

resources "azurerm_resource_group" "rg"  {
  name  = "rg-hackathon-demo"
  location = "East US"
}

resource "azurerm_storage_account" "storage" {
  name = "hackathonstroage123"
  resource_group_name = azure_resource_group.rg.name
  location =  azure_resource_group.rg.location
  account_tier = "standard"
  account_replication_type = "LRS"
}

resouces "azurerm_app_service_plan" "plan" {
  name = func-app_plan
  location = azurerm_resource_group.rg.location
  resource_group_name = azure_resource_group.rg.name

sku {
  tier = "Dynamic"
  size = "Y1"
}

 os_type = "Windows"
}
  
