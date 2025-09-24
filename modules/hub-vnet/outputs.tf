output "vnet_id" {
  description = "The ID of the Hub VNet"
  value       = azurerm_virtual_network.hub.id
}

output "vnet_name" {
  description = "The name of the Hub VNet"
  value       = azurerm_virtual_network.hub.name
}

output "trust_subnet_id" {
  description = "The ID of the trust subnet"
  value       = azurerm_subnet.trust.id
}