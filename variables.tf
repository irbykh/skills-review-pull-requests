variable "hub_vnet_cidr" {
  description = "CIDR block for the Hub VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "identity_vnet_cidr" {
  description = "CIDR block for the Identity VNet"
  type        = string
  default     = "192.168.1.0/16"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}