output "aks_cluster_name" {
  description = "Nombre del cluster AKS"
  value       = azurerm_kubernetes_cluster.kub_cluster.name
}

output "aks_kube_config" {
  description = "Kubeconfig para acceder al cluster AKS"
  value       = azurerm_kubernetes_cluster.kub_cluster.kube_config_raw
  sensitive   = true
}

output "aks_fqdn" {
  description = "FQDN del cluster AKS"
  value       = azurerm_kubernetes_cluster.kub_cluster.fqdn
}

output "storage_account_name" {
  description = "Nombre de la cuenta de almacenamiento"
  value       = azurerm_storage_account.st_account.name
}

output "storage_account_primary_key" {
  description = "Clave primaria de la cuenta de almacenamiento"
  value       = azurerm_storage_account.st_account.primary_access_key
  sensitive   = true
}
output "role_assignment_scope" {
  description = "El ámbito del rol de asignación para el AKS."
  value = azurerm_role_assignment.ra.scope
  
}
output "skip_service_principal_aad_check" {
  description = "Indica si se debe omitir la verificación de AAD para el Service Principal."
  value = azurerm_role_assignment.ra.skip_service_principal_aad_check

}