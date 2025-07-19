#Terraform Variables

variable "subscription_id" {
  description = "The Azure subscription ID"
  default     = "your-subscription-id"
}
variable "tenant_id" {
  description = "The Azure tenant ID"
  default     = "your-tenant-id"
}

variable "env" {
  description = "The environment for the deployment"
  default     = "dev"
}
variable "region" {
  description = "The Azure region to deploy the infrastructure"
  default     = "us-east-1"
}
variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "${env}_ResourceGroup"
}
variable "location" {
  description = "The location of the resource group"
  default     = "East US"  # eastus1
}
variable "app_service_name" {
  description = "The name of the app service"
  default     = "${env}AppService"
}

variable "app_service_plan_name" {
  description = "The name of the app service plan"
  default     = "${env}-app-service-plan"
  
}

variable "function_app_name" {
  description = "The name of the function app"
  default     = "${env}-appointment-service-FunctionApp"
}

variable "app_storage_name" {
  description = "The name of the storage account"
  default     = "${env}StorageAccount"
}
