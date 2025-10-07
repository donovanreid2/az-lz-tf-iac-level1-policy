#Providers
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-mgmt-shared-wus-prd-1"
    storage_account_name = "strmhstatemgmtprd"
    container_name       = "level1"
    key                  = "azurepolicy.terraform.tfstate"
    subscription_id      = "79ce1d43-a7ce-448e-a6fd-6735b57cdb3b"
    tenant_id            = "9355113d-9b47-451b-87b5-f3ee414fffbe"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = " ~> 3.0"
    }
  }
}
