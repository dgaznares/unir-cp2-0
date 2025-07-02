output "virtual_network_id" {
  description = "El ID de la red virtual creada."
  value       = azurerm_virtual_network.vnet.id
}

output "public_ip_address" {
  description = "La IP pública asignada a la máquina virtual."
  value       = azurerm_public_ip.public_ip.ip_address
}

output "linux_vm_id" {
  description = "El ID de la máquina virtual Linux creada."
  value       = azurerm_linux_virtual_machine.linux_vm.id
}

output "linux_vm_public_ip" {
  description = "La IP pública de la máquina virtual Linux."
  value       = azurerm_public_ip.public_ip.ip_address
}

output "linux_vm_admin_username" {
  description = "El usuario administrador de la máquina virtual Linux."
  value       = azurerm_linux_virtual_machine.linux_vm.admin_username
}
output "linux_vm_admin_password" {
  description = "El password del usuario administrador de la máquina virtual Linux."
  value       = azurerm_linux_virtual_machine.linux_vm.admin_password
  sensitive   = true
}
output "linux_vm_size" {
  description = "Tamaño de la máquina virtual"
  value       = azurerm_linux_virtual_machine.linux_vm.size
}
output "linux_ni_name" {
  description = "Nombre de la interfaz de red (Network Interface)"
  value = azurerm_network_interface.ni.name
}
output "linux_subnet_name" {
  description = "Nombre de la subred"
  value = azurerm_subnet.subnet.name
}
output "linux_subnet_address_prefix" {
  description = "Prefijo de dirección de la subred"
  value = azurerm_subnet.subnet.address_prefixes
}

output "linux_nsg_name" {
  description = "Nombre del grupo de seguridad de red"
  value     = azurerm_network_security_group.nsg.name
}
output "linux_nsr_name" {
  description = "Nombre de la regla de seguridad de red"
  value     = azurerm_network_security_rule.nsr.name
}
output "linux_nsr_priority" {
  description = "Prioridad de la regla de seguridad de red"
  value       = azurerm_network_security_rule.nsr.priority
}
output "linux_nsr_direction" {
  description = "Dirección de la regla de seguridad de red"
  value       = azurerm_network_security_rule.nsr.direction
}
output "linux_nsr_access" {
  description = "Acceso de la regla de seguridad de red"
  value       = azurerm_network_security_rule.nsr.access
}
output "linux_nsr_protocol" {
  description = "Protocolo de la regla de seguridad de red"
  value       = azurerm_network_security_rule.nsr.protocol
}
output "linux_nsr_source_port_range" {
  description = "Rango de puertos de origen de la regla de seguridad de red"
  value       = azurerm_network_security_rule.nsr.source_port_range
}
output "linux_nsr_destination_port_range" {
  description = "Rango de puertos de destino de la regla de seguridad de red"
  value       = azurerm_network_security_rule.nsr.destination_port_range
}
output "linux_nsr_source_address_prefix" {
  description = "Prefijo de dirección de origen de la regla de seguridad de red"
  value       = azurerm_network_security_rule.nsr.source_address_prefix
}
output "linux_nsr_destination_address_prefix" {
  description = "Prefijo de dirección de destino de la regla de seguridad de red"
  value       = azurerm_network_security_rule.nsr.destination_address_prefix
} 
output "linux_nsr_rg_name" {
  description = "Nombre del grupo de recursos para la regla de seguridad de red"
  value       = azurerm_network_security_rule.nsr.resource_group_name
}   
output "linux_nsr_nsg_name" {
  description = "Nombre del grupo de seguridad de red para la regla de seguridad"
  value       = azurerm_network_security_rule.nsr.network_security_group_name
} 
