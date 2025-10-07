provider "azurerm" {

  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = var.subscription_id

}



# locals {
#   subscription_id = var.subscription_id != "" ? var.subscription_id : null
#   client_id       = var.client_id       != "" ? var.client_id       : null
#   client_secret   = var.client_secret   != "" ? var.client_secret   : null
#   tenant_id       = var.tenant_id       != "" ? var.tenant_id       : null
# }

# provider "azurerm" {
#   features {}

#   subscription_id = local.subscription_id
#   client_id       = local.client_id
#   client_secret   = local.client_secret
#   tenant_id       = local.tenant_id
# }
