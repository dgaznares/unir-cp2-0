resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.acr_sku

  admin_enabled       = true

 identity{
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.acr_identity.id]
  }

  tags = {
    environment = "dev"
    project     = "unir-cp2-0"
  }
}
resource "azurerm_user_assigned_identity" "acr_identity" {
    name                = "${var.acr_name}-identity"
    resource_group_name = var.resource_group_name
    location            = var.location

 
    tags = {
      environment = "dev"
      project     = "unir-cp2-0"
    }
  }
  
