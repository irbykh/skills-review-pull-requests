resource "azurerm_virtual_network" "hub" {
  name                = "vnet-hub-east"
  address_space       = [var.vnet_cidr]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "trust" {
  name                 = "snet-trust-east"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = [var.trust_subnet_cidr]
}