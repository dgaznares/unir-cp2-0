# Para crear una VM en Azure con Terraform, se deben definir varios recursos como el grupo de recursos, la red virtual, 
# la IP pública, la interfaz de red y la máquina virtual en sí. 

##############################################################################
#Creamos los recursos necesarioa para crear y manejar la red.
##############################################################################
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}
resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"

  tags = var.tags
}

resource "azurerm_network_interface" "ni" {
  name                = var.ni_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = var.tags
  
}
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefix
}


###############################################################################
#Creamos los recursos necesarioa para crear y majejar la seguridad.
###############################################################################
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}


resource "azurerm_network_security_rule" "nsr-allow-22" {
  name                        = "Allow-SSH-Port-22"
  priority                    = 101
  direction                   = var.nsr_direction_Inbound
  access                      = var.nsr_access_Allow
  protocol                    = var.nsr_protocol_Tcp
  source_port_range           = var.nsr_source_port_range
  destination_port_range      = "22" # Puerto SSH
  source_address_prefix       = var.nsr_source_address_prefix
  destination_address_prefix  = var.nsr_destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
  description = "Regla que permiti acceso SSH al puerto 22."
}

resource "azurerm_network_security_rule" "nsr-allow-8080" {
  name                        = "Allow-Port-8080"
  priority                    = 201
  direction                   = var.nsr_direction_Inbound
  access                      = var.nsr_access_Allow
  protocol                    = var.nsr_protocol_Tcp
  source_port_range           = var.nsr_source_port_range
  destination_port_range      = "8080" # Puerto 8080
  source_address_prefix       = var.nsr_source_address_prefix
  destination_address_prefix  = var.nsr_destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
  description = "Regla que permiti acceso al puerto 8080."
}

resource "azurerm_network_security_rule" "nsr-allow-443" {
  name                        = "Allow-Port-443"
  priority                    = 301
  direction                   = var.nsr_direction_Inbound
  access                      = var.nsr_access_Allow
  protocol                    = var.nsr_protocol_Tcp
  source_port_range           = var.nsr_source_port_range
  destination_port_range      = "443"
  source_address_prefix       = var.nsr_source_address_prefix
  destination_address_prefix  = var.nsr_destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
  description = "Regla que permite acceso al puerto 443."
}


resource "azurerm_network_interface_security_group_association" "nisga" {
  network_interface_id      = azurerm_network_interface.ni.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

###############################################################################
#Creamos la maquina virtual de Linux.
###############################################################################

resource "tls_private_key" "linux_vm_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "linux_private_key_pem" {
  content  = tls_private_key.linux_vm_ssh_key.private_key_pem
  filename = pathexpand(var.private_key_pem_path)
  file_permission = var.private_key_pem_permission # Importante para la seguridad de la clave privada
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    #public_key = pathexpand(var.public_key_path)
    public_key = tls_private_key.linux_vm_ssh_key.public_key_openssh
  }
  
  network_interface_ids = [azurerm_network_interface.ni.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  tags = var.tags
}
