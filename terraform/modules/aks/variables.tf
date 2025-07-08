variable "aks_name" {
    description = "El nombre del Azure Kubernetes Service (AKS)."
    type        = string
    default     = "unir-dgm-aks"
}
variable "location" {
    description = "La ubicación donde se desplegará el AKS."
    type        = string
}
variable "resource_group_name" {
    description = "El nombre del grupo de recursos donde se desplegará el AKS."
    type        = string
}
variable "dns_prefix" {
    description = "El prefijo DNS para el AKS."
    type        = string
}
variable "node_count" { 
    default = 1 
    description = "El número de nodos en el grupo de nodos del AKS."
    type = number
}
variable "vm_size" { 
    description = "El tamaño de las máquinas virtuales en el grupo de nodos del AKS."
    type        = string
    default = "Standard_B2ls_v2"
}
variable "tags" { 
    description = "Las etiquetas para el AKS."
    type        = map(string)
    default     = {
        environment = "dev"
        project     = "unir-cp2-0"
    }
}
variable "storage_account_name" {
  description = "El nombre del Azure Storage Account para el AKS."
  type        = string
}
variable "role_assignment_scope" {
  description = "El ámbito del rol de asignación para el AKS."
  type        = string
}
variable "skip_service_principal_aad_check" {
    type = bool
    description = "Indica si se debe omitir la verificación de AAD para el Service Principal."
    default = true
}