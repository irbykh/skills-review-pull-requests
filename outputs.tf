output "hub_vnet_id" {
  description = "The ID of the Hub VNet"
  value       = module.hub_vnet.vnet_id
}

output "identity_vnet_id" {
  description = "The ID of the Identity VNet"
  value       = module.identity_vnet.vnet_id
}

output "load_balancer_frontend_ip" {
  description = "The frontend IP address of the internal load balancer"
  value       = module.load_balancer.frontend_ip_address
}

output "private_dns_resolver_id" {
  description = "The ID of the Private DNS Resolver"
  value       = module.private_dns_resolver.resolver_id
}

output "dns_inbound_endpoint_ip" {
  description = "The IP address of the DNS inbound endpoint"
  value       = module.private_dns_resolver.inbound_endpoint_ip
}

output "dns_outbound_endpoint_ip" {
  description = "The IP address of the DNS outbound endpoint"
  value       = module.private_dns_resolver.outbound_endpoint_ip
}