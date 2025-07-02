variable "vnet_name" {
  description = "Nombre de la virtual network"
  type        = string
  default     = "vnet"
}
variable "vnet_address_space" {
    type = list(string)
    description = "Espacio de direcciones de la virtual network"
    default = [ "10.0.0.0/16" ]
}
variable "location" {
  description = "Ubicación de los recursos"
  type        = string
  default     = "westeurope"
}
variable "resource_group_name" {
  description = "Nombre del resource group donde se crearán los recursos"
  type        = string
  default     = "unir-dgm-rg"
  
}
variable "tags" {
  description = "Etiquetas para los recursos"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "unir-cp2-0"
  }
  
}
variable "public_ip_name" {
    description = "Nombre de la IP pública"
    type        = string
    default     = "unir-dgm-public-ip"
}
variable "vm_name" {
  description = "Nombre de la máquina virtual de linux"
  type        = string
  default     = "unir-dgm-linux-vm"
}
variable "vm_size" {
  description = "Tamaño de la máquina virtual"
  type        = string
  default     = "Standard_B2ls_v2"
}
variable "admin_username" {
  description = "Nombre de usuario del administrador de la máquina virtual"
  type        = string
  default     = "dgmunir"
}
variable "admin_password" {
  description = "Contraseña del administrador de la máquina virtual"
  type        = string
  default     = "Password1234!"
  sensitive   = true
}

variable "ni_name" {
  description = "Nombre de la interfaz de red (Network Interface)"
  type        = string
  default     = "unir-dgm-ni"
  
}
variable "subnet_name" {
  description = "Nombre de la subred"
  type        = string
  default     = "unir-dgm-subnet"
}
variable "subnet_address_prefix" {
  description = "Prefijo de dirección de la subred"
  type = list(string)
  default     = ["10.0.1.0/24"]
}
variable "nsg_name" {
  description = "Nombre del grupo de seguridad de red"
  type        = string
  default     = "unir-dgm-nsg"
  
}
variable "nsr_name" {
  description = "Nombre de la regla de seguridad de red"
  type        = string
  default     = "unir-dgm-nsr-ssh"
  
}
variable "nsr_priority" {
  description = "Prioridad de la regla de seguridad de red"
  type        = number
  default     = 1001
}
variable "nsr_direction" {
  description = "Dirección de la regla de seguridad de red"
  type        = string
  default     = "Inbound"
}
variable "nsr_access" {
  description = "Acceso de la regla de seguridad de red"
  type        = string
  default     = "Allow"
}
variable "nsr_protocol" {
  description = "Protocolo de la regla de seguridad de red"
  type        = string
  default     = "Tcp"
}
variable "nsr_source_port_range" {
  description = "Rango de puertos de origen de la regla de seguridad de red"
  type        = string
  default     = "*"     
}
variable "nsr_destination_port_range" {
  description = "Rango de puertos de destino de la regla de seguridad de red"
  type        = string
  default     = "22" # Puerto SSH
}
variable "nsr_source_address_prefix" {
  description = "Prefijo de dirección de origen de la regla de seguridad de red"
  type        = string
  default     = "*" # Permitir desde cualquier dirección
}
variable "nsr_destination_address_prefix" {
  description = "Prefijo de dirección de destino de la regla de seguridad de red"
  type        = string
  default     = "*" # Permitir a cualquier dirección
} 
variable "nsr_resource_group_name" {
  description = "Nombre del grupo de recursos para la regla de seguridad de red"
  type        = string
  default     = "unir-dgm-rg"
}   
variable "nsr_network_security_group_name" {
  description = "Nombre del grupo de seguridad de red para la regla de seguridad"
  type        = string
  default     = "unir-dgm-nsg"
} 
variable "public_key_path" {
  description = "Ruta al archivo de clave pública SSH"
  type        = string
  default     = "~/.ssh/id_rsa_azure_vm.pub"
  
}