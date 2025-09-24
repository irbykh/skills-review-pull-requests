resource "azurerm_virtual_network_peering" "hub_to_identity" {
  name                         = "hub-to-identity"
  resource_group_name          = var.hub_resource_group
  virtual_network_name         = var.hub_vnet_name
  remote_virtual_network_id    = var.identity_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "identity_to_hub" {
  name                         = "identity-to-hub"
  resource_group_name          = var.identity_resource_group
  virtual_network_name         = var.identity_vnet_name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}