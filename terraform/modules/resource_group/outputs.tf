output "resource_group_values" {
  value = join("-", [
    azurerm_resource_group.rg.name,
    azurerm_resource_group.rg.location
    ])
}
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}