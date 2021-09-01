resource azurerm_resource_group main {
  name     = "rg-${replace(title(var.application_full_name)," ","")}-${var.application_environment}"
  location = var.azure_location

  tags = {
    application-full-name   = var.application_full_name
    application-short-name  = var.application_short_name
    application-environment = var.application_environment
  }
}

# Assign contributor role to this Resource Group
resource azurerm_role_assignment main {
  count                = length(var.contributors)
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Contributor"
  principal_id         = element(var.contributors, count.index)
}