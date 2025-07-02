output "acr_name" {
  value = azurerm_container_registry.acr.name
  description = "Nombre del Azure Container Registry"
}
output "acr_id" {
    value = azurerm_container_registry.acr.id
    description = "Id del Azure Container Registry"
}
output "acr_identity_name" {
  value = azurerm_user_assigned_identity.acr_identity.name
    description = "Nombre de la identidad asignada al Azure Container Registry"
}
output "acr_identity_id" {
    value = azurerm_user_assigned_identity.acr_identity.id
    description = "Id de la identidad asignada al Azure Container Registry"
}
