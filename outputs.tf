output "vpn_server_configurations_id" {
  description = "Map of id values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.id }
}
output "vpn_server_configurations_azure_active_directory_authentication" {
  description = "Map of azure_active_directory_authentication values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.azure_active_directory_authentication }
}
output "vpn_server_configurations_client_revoked_certificate" {
  description = "Map of client_revoked_certificate values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.client_revoked_certificate }
}
output "vpn_server_configurations_client_root_certificate" {
  description = "Map of client_root_certificate values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.client_root_certificate }
}
output "vpn_server_configurations_ipsec_policy" {
  description = "Map of ipsec_policy values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.ipsec_policy }
}
output "vpn_server_configurations_location" {
  description = "Map of location values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.location }
}
output "vpn_server_configurations_name" {
  description = "Map of name values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.name }
}
output "vpn_server_configurations_radius" {
  description = "Map of radius values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.radius }
  sensitive   = true
}
output "vpn_server_configurations_resource_group_name" {
  description = "Map of resource_group_name values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.resource_group_name }
}
output "vpn_server_configurations_tags" {
  description = "Map of tags values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.tags }
}
output "vpn_server_configurations_vpn_authentication_types" {
  description = "Map of vpn_authentication_types values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.vpn_authentication_types }
}
output "vpn_server_configurations_vpn_protocols" {
  description = "Map of vpn_protocols values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.vpn_protocols }
}

