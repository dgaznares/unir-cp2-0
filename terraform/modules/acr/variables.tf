  variable "acr_name"{
    type        = string
    description = "Nombre del Azure Container Registry"
  }
  variable "resource_group_name"{
    type        = string
    description = "Nombre del resource group donde se creará el Azure Container Registry"
  }
  variable "location"  {
    type        = string
    description = "Ubicación del Azure Container Registry"
  }
  variable "acr_sku" {
    type        = string
    description = "SKU del Azure Container Registry"
    default     = "Basic"
  }
