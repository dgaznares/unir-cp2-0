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

output "linux_nsr_values" {
  description = "Valores de la regla de las reglas seguridad de entrada al Network Security Group (NSG)."
  value = [
    azurerm_network_security_rule.nsr-allow-22.name,
    azurerm_network_security_rule.nsr-allow-8080.name,
    azurerm_network_security_rule.nsr-allow-443.name
  ]
  
}