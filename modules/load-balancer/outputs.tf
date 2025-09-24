output "load_balancer_id" {
  description = "The ID of the internal load balancer"
  value       = azurerm_lb.internal.id
}

output "frontend_ip_address" {
  description = "The frontend IP address of the internal load balancer"
  value       = azurerm_lb.internal.frontend_ip_configuration[0].private_ip_address
}

output "backend_address_pool_id" {
  description = "The ID of the backend address pool"
  value       = azurerm_lb_backend_address_pool.backend.id
}