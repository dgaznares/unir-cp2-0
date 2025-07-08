resource "azurerm_kubernetes_cluster" "kub_cluster" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
  
}

resource "azurerm_storage_account" "st_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  tags = var.tags
  
}
resource "azurerm_role_assignment" "ra" {
  principal_id                     = azurerm_kubernetes_cluster.kub_cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.role_assignment_scope
  skip_service_principal_aad_check = var.skip_service_principal_aad_check

}