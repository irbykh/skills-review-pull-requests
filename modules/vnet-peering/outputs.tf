output "hub_to_identity_peering_id" {
  description = "The ID of the Hub to Identity VNet peering"
  value       = azurerm_virtual_network_peering.hub_to_identity.id
}

output "identity_to_hub_peering_id" {
  description = "The ID of the Identity to Hub VNet peering"
  value       = azurerm_virtual_network_peering.identity_to_hub.id
}