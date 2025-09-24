resource "azurerm_virtual_network" "identity" {
  name                = "vnet-idnt-east"
  address_space       = [var.vnet_cidr]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "infra" {
  name                 = "snet-idnt-infra-east"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.identity.name
  address_prefixes     = [var.infra_subnet_cidr]
}

resource "azurerm_subnet" "dns_inbound" {
  name                 = "snet-idnt-dns-inbound-east"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.identity.name
  address_prefixes     = [var.dns_inbound_subnet_cidr]

  delegation {
    name = "Microsoft.Network.dnsResolvers"
    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

resource "azurerm_subnet" "dns_outbound" {
  name                 = "snet-idnt-dns-outbound-east"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.identity.name
  address_prefixes     = [var.dns_outbound_subnet_cidr]

  delegation {
    name = "Microsoft.Network.dnsResolvers"
    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}