variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region for resources"
  type        = string
}

variable "vnet_cidr" {
  description = "CIDR block for the Hub VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "trust_subnet_cidr" {
  description = "CIDR block for the trust subnet"
  type        = string
  default     = "10.0.1.0/24"
}