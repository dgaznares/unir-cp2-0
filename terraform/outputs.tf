
# Outputs para el Resource Group
# Este archivo define las salidas que se generarán al aplicar el módulo de Resource Group.
output "resource_group_values" {
  value       = module.resource_group.resource_group_values
  description = "Valores del Resource Group, incluyendo nombre y ubicación"
}
output "resource_group_name" {
  value       = module.resource_group.resource_group_name
  description = "Nombre del Resource Group"
}
output "resource_group_location" {
  value       = module.resource_group.resource_group_location
  description = "Ubicación del Resource Group"
}
#Outputs para el Azure Container Registry y la identidad asignada
# Este archivo define las salidas que se generarán al aplicar el módulo de ACR.
output "acr_name" {
  value       = module.acr.acr_name
  description = "Nombre del Azure Container Registry"
}
output "acr_id" {
  value       = module.acr.acr_id
  description = "Id del Azure Container Registry"
}
output "acr_identity_name" {
  value       = module.acr.acr_identity_name
  description = "Nombre de la identidad asignada al Azure Container Registry"
}
output "acr_identity_id" {
  value       = module.acr.acr_identity_id
  description = "Id de la identidad asignada al Azure Container Registry"
}

# Outputs para el Azure Kubernetes Service
# Este archivo define las salidas que se generarán al aplicar el módulo de AKS.
output "aks_cluster_name" {
  description = "Nombre del cluster AKS"
  value       = module.aks.aks_cluster_name
}

output "aks_kube_config" {
  description = "Kubeconfig para acceder al cluster AKS"
  value       = module.aks.aks_kube_config
  sensitive   = true
}

output "aks_fqdn" {
  description = "FQDN del cluster AKS"
  value       = module.aks.aks_fqdn
}

output "aks_storage_account_name" {
  description = "Nombre de la cuenta de almacenamiento"
  value       = module.aks.storage_account_name
}

output "aks_storage_account_primary_key" {
  description = "Clave primaria de la cuenta de almacenamiento"
  value       = module.aks.storage_account_primary_key
  sensitive   = true
}
output "aks_role_assignment_scope" {
  description = "El ámbito del rol de asignación para el AKS."
  value = module.aks.role_assignment_scope
  
}
output "aks_skip_service_principal_aad_check" {
  description = "Indica si se debe omitir la verificación de AAD para el Service Principal."
  value = module.aks.skip_service_principal_aad_check

}

# Outputs para la máquina virtual
# Este archivo define las salidas que se generarán al aplicar el módulo de VM.
output "virtual_network_id" {
  description = "El ID de la red virtual creada."
  value       = module.vm.virtual_network_id
}

output "public_ip_address" {
  description = "La IP pública asignada a la máquina virtual."
  value       = module.vm.public_ip_address
}

output "linux_vm_id" {
  description = "El ID de la máquina virtual Linux creada."
  value       = module.vm.linux_vm_id
}

output "linux_vm_public_ip" {
  description = "La IP pública de la máquina virtual Linux."
  value       = module.vm.linux_vm_public_ip
}

output "linux_vm_admin_username" {
  description = "El usuario administrador de la máquina virtual Linux."
  value       = module.vm.linux_vm_admin_username
}
output "linux_vm_admin_password" {
  description = "El password del usuario administrador de la máquina virtual Linux."
  value       = module.vm.linux_vm_admin_password
  sensitive   = true
}
output "linux_vm_size" {
  description = "Tamaño de la máquina virtual"
  value       = module.vm.linux_vm_size
}
output "linux_ni_name" {
  description = "Nombre de la interfaz de red (Network Interface)"
  value       = module.vm.linux_ni_name
}
output "linux_subnet_name" {
  description = "Nombre de la subred"
  value       = module.vm.linux_subnet_name
}
output "linux_subnet_address_prefix" {
  description = "Prefijo de dirección de la subred"
  value       = module.vm.linux_subnet_address_prefix
}

output "linux_nsg_name" {
  description = "Nombre del grupo de seguridad de red"
  value       = module.vm.linux_nsg_name
}
output "linux_nsr_values" {
  description = "Nombre de la regla de seguridad de red"
  value       = module.vm.linux_nsr_values
}


