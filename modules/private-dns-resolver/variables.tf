variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region for resources"
  type        = string
}

variable "identity_vnet_id" {
  description = "The ID of the Identity VNet"
  type        = string
}

variable "dns_inbound_subnet_id" {
  description = "The ID of the DNS inbound subnet"
  type        = string
}

variable "dns_outbound_subnet_id" {
  description = "The ID of the DNS outbound subnet"
  type        = string
}