provider "azurerm" {
  features {}
}

locals {
  azure_location          = "westeurope"
  application_full_name   = "Hello World"
  application_short_name  = "HW"
  application_environment = "dev"
  service_principal_purpose = "azdo"
}

module "azure_ad_sp" {
  source                    = "git::https://github.com/0xdbe-terraform/terraform-azure-ad-service-principal.git?ref=v2.0.1"
  application_full_name     = local.application_full_name
  application_environment   = local.application_environment
  service_principal_purpose = local.service_principal_purpose
}

module "azure_ressource_group" {
  source                 = "git::https://github.com/thomisza/tf-az-rg.git"
  azure_location          = local.azure_location
  application_full_name   = local.application_full_name
  application_short_name  = local.application_short_name
  application_environment = local.application_environment
}