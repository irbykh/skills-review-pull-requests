variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region for resources"
  type        = string
}

variable "vnet_cidr" {
  description = "CIDR block for the Identity VNet"
  type        = string
  default     = "192.168.1.0/16"
}

variable "infra_subnet_cidr" {
  description = "CIDR block for the infrastructure subnet"
  type        = string
  default     = "192.168.1.0/24"
}

variable "dns_inbound_subnet_cidr" {
  description = "CIDR block for the DNS inbound subnet"
  type        = string
  default     = "192.168.2.0/24"
}

variable "dns_outbound_subnet_cidr" {
  description = "CIDR block for the DNS outbound subnet"
  type        = string
  default     = "192.168.3.0/24"
}