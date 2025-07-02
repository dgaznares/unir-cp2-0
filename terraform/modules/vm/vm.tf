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

resource "azurerm_network_security_rule" "nsr" {
  name                        = var.nsr_name
  priority                    = var.nsr_priority
  direction                   = var.nsr_direction
  access                      = var.nsr_access
  protocol                    = var.nsr_protocol
  source_port_range           = var.nsr_source_port_range
  destination_port_range      = var.nsr_destination_port_range
  source_address_prefix       = var.nsr_source_address_prefix
  destination_address_prefix  = var.nsr_destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_interface_security_group_association" "nisga" {
  network_interface_id      = azurerm_network_interface.ni.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

###############################################################################
#Creamos la maquina virtual de Linux.
###############################################################################
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
    public_key = file(var.public_key_path)
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
