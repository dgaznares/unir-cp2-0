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
