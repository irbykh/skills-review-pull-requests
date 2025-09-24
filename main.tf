terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Groups
resource "azurerm_resource_group" "hub" {
  name     = "rg-hub-east"
  location = "East US"
}

resource "azurerm_resource_group" "identity" {
  name     = "rg-identity-east"
  location = "East US"
}

# Hub VNet Module
module "hub_vnet" {
  source              = "./modules/hub-vnet"
  resource_group_name = azurerm_resource_group.hub.name
  location            = azurerm_resource_group.hub.location
}

# Identity VNet Module
module "identity_vnet" {
  source              = "./modules/identity-vnet"
  resource_group_name = azurerm_resource_group.identity.name
  location            = azurerm_resource_group.identity.location
}

# VNet Peering Module
module "vnet_peering" {
  source                  = "./modules/vnet-peering"
  hub_vnet_id             = module.hub_vnet.vnet_id
  hub_vnet_name           = module.hub_vnet.vnet_name
  hub_resource_group      = azurerm_resource_group.hub.name
  identity_vnet_id        = module.identity_vnet.vnet_id
  identity_vnet_name      = module.identity_vnet.vnet_name
  identity_resource_group = azurerm_resource_group.identity.name
}

# Internal Load Balancer Module
module "load_balancer" {
  source              = "./modules/load-balancer"
  resource_group_name = azurerm_resource_group.hub.name
  location            = azurerm_resource_group.hub.location
  trust_subnet_id     = module.hub_vnet.trust_subnet_id
}

# Private DNS Resolver Module
module "private_dns_resolver" {
  source                 = "./modules/private-dns-resolver"
  resource_group_name    = azurerm_resource_group.identity.name
  location               = azurerm_resource_group.identity.location
  identity_vnet_id       = module.identity_vnet.vnet_id
  dns_inbound_subnet_id  = module.identity_vnet.dns_inbound_subnet_id
  dns_outbound_subnet_id = module.identity_vnet.dns_outbound_subnet_id
}