  # specify the provide version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# configure the provider
provider "azurerm" {    
    features {}

    client_id = var.tenent_id
    client_secret = var.subscription_id
    subscription_id =  var.client_id
    tenant_id = var.client_secret
}
