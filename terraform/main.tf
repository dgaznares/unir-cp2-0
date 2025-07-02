terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  required_version = ">= 1.1.0"
}
provider "azurerm" {
  features {}
  subscription_id = var.azure_subcription_id
}

module "resource_group" {
  source                  = "./modules/resource_group"
  resource_group_name     = "unir-dgm-rg"
  resource_group_location = var.location
}
module "acr" {
  source              = "./modules/acr"
  acr_name            = "unirdgmacr"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location

}
module "aks" {
  source               = "./modules/aks"
  aks_name             = "unirdgmaks"
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  storage_account_name = "unirdgmstorageaccount"
  dns_prefix           = "unirdgmaks"

}
module "vm" {
  source              = "./modules/vm"
  vm_name             = "unirdgmdvm"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}