module "avm-ptn-policyassignment" {
  source  = "Azure/avm-ptn-policyassignment/azurerm"
  version = "0.2.0"

  for_each = local.policy_assignments

  name                 = substr(lower(replace("${each.key}-${each.value.display_name}", "[^a-zA-Z0-9]", "-")), 0, 24)
  location             = each.value.location
  policy_definition_id = each.value.policy_definition_id
  scope                = each.value.scope

  display_name = try(each.value.display_name, null)
  description  = try(each.value.description, null)
  enforce      = try(each.value.enforce, "Default")
  parameters   = try(each.value.parameters, null)
  identity     = try(local.policy_identities[each.key], null)
  role_assignments = {
    netcontrib = {
      role_definition_id_or_name = "Network Contributor"
      # principal_id is wired up automatically by the module to the assignment identity
      principal_id = "ignored-by-caller" # placeholder; module replaces it
      # optional: description = "DINE remediation for network writes"
    }
    loganalytics = {
      role_definition_id_or_name = "Log Analytics Contributor"
      principal_id               = "ignored-by-caller"
    }
    stg_contrib = {
      role_definition_id_or_name = "Storage Account Contributor"
      principal_id               = "ignored-by-caller"
    }
    stg_blob = {
      role_definition_id_or_name = "Storage Blob Data Contributor"
      principal_id               = "ignored-by-caller"
    }
    monitor = {
      role_definition_id_or_name = "Monitoring Contributor"
      principal_id               = "ignored-by-caller"
    }
  }


}
