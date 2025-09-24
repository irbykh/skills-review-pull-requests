variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region for resources"
  type        = string
}

variable "trust_subnet_id" {
  description = "The ID of the trust subnet where the load balancer frontend will be placed"
  type        = string
}