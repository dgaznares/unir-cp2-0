variable "azure_subcription_id" {
  default     = "f46a3ab2-b843-49db-8891-5639001683aa"
  description = "Id de mi suscripcion de AZURE"
}
variable "location" {
  type        = string
  default     = "West Europe"
  description = "Ubicación del primer resource group de terraform para UNIR"
}
variable "admin_username" {
  type        = string
  default     = "dgmunir"
  description = "Nombre de usuario del administrador de la VM"

}
variable "admin_password" {
  type        = string
  default     = "Password1234!"
  description = "Contraseña del administrador de la VM"
}
variable "aks_sku" {
  type        = string
  default     = "Standard_B2ls_v2"
  description = "SKU de los nodos del AKS"
}
variable "aks_node_count" {
  type        = number
  default     = 3
  description = "Número de nodos del AKS"

}
variable "aks_node_vm_size" {
  type        = string
  default     = "Standard_B2ls_v2"
  description = "Tamaño de las máquinas virtuales de los nodos del AKS"

}