variable "hub_vnet_id" {
  description = "The ID of the Hub VNet"
  type        = string
}

variable "hub_vnet_name" {
  description = "The name of the Hub VNet"
  type        = string
}

variable "hub_resource_group" {
  description = "The name of the Hub resource group"
  type        = string
}

variable "identity_vnet_id" {
  description = "The ID of the Identity VNet"
  type        = string
}

variable "identity_vnet_name" {
  description = "The name of the Identity VNet"
  type        = string
}

variable "identity_resource_group" {
  description = "The name of the Identity resource group"
  type        = string
}