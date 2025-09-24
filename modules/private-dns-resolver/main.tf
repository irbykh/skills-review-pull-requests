resource "azurerm_private_dns_resolver" "identity" {
  name                = "prs-idnt-dns-east"
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_network_id  = var.identity_vnet_id
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "inbound" {
  name                    = "inbound-endpoint"
  private_dns_resolver_id = azurerm_private_dns_resolver.identity.id
  location                = var.location
  ip_configurations {
    private_ip_allocation_method = "Dynamic"
    subnet_id                    = var.dns_inbound_subnet_id
  }
}

resource "azurerm_private_dns_resolver_outbound_endpoint" "outbound" {
  name                    = "outbound-endpoint"
  private_dns_resolver_id = azurerm_private_dns_resolver.identity.id
  location                = var.location
  subnet_id               = var.dns_outbound_subnet_id
}