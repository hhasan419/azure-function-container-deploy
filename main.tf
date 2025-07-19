# create Azure function app with a resource group and app service plan
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_app_service_plan" "service_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier     = "Standard"
    size     = "S1"
  }
}

# create storage account for the function app
resource "azurerm_storage_account" "dev" {  
    name                     = var.app_storage_name
    resource_group_name      = azurerm_resource_group.dev.name
    location                 = azurerm_resource_group.dev.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
    }

resource "azurerm_function_app" "dev" {
  name                       = var.app_service_name
  location                   = azurerm_resource_group.dev.location
  resource_group_name        = azurerm_resource_group.dev.name
  app_service_plan_id        = azurerm_app_service_plan.dev.id
  storage_account_name       = azurerm_storage_account.dev.name
  storage_account_access_key = azurerm_storage_account.dev.primary_access_key

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "node"
    WEBSITE_NODE_DEFAULT_VERSION = "~22"
  }
}

output "app_service_plan_id" {
  value = azurerm_app_service_plan.dev.id
}

output "function_app_name" {
  value = azurerm_function_app.dev.name
}
