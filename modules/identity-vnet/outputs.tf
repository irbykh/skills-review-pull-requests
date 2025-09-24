output "vnet_id" {
  description = "The ID of the Identity VNet"
  value       = azurerm_virtual_network.identity.id
}

output "vnet_name" {
  description = "The name of the Identity VNet"
  value       = azurerm_virtual_network.identity.name
}

output "infra_subnet_id" {
  description = "The ID of the infrastructure subnet"
  value       = azurerm_subnet.infra.id
}

output "dns_inbound_subnet_id" {
  description = "The ID of the DNS inbound subnet"
  value       = azurerm_subnet.dns_inbound.id
}

output "dns_outbound_subnet_id" {
  description = "The ID of the DNS outbound subnet"
  value       = azurerm_subnet.dns_outbound.id
}