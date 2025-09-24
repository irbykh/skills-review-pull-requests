output "resolver_id" {
  description = "The ID of the Private DNS Resolver"
  value       = azurerm_private_dns_resolver.identity.id
}

output "inbound_endpoint_id" {
  description = "The ID of the inbound endpoint"
  value       = azurerm_private_dns_resolver_inbound_endpoint.inbound.id
}

output "inbound_endpoint_ip" {
  description = "The IP address of the inbound endpoint"
  value       = azurerm_private_dns_resolver_inbound_endpoint.inbound.ip_configurations[0].private_ip_address
}

output "outbound_endpoint_id" {
  description = "The ID of the outbound endpoint"
  value       = azurerm_private_dns_resolver_outbound_endpoint.outbound.id
}

output "outbound_endpoint_ip" {
  description = "The IP address of the outbound endpoint (note: outbound endpoints don't have specific IPs)"
  value       = "outbound endpoint configured"
}