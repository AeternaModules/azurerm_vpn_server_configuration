output "vpn_server_configurations_id" {
  description = "Map of id values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "vpn_server_configurations_azure_active_directory_authentication" {
  description = "Map of azure_active_directory_authentication values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.azure_active_directory_authentication if v.azure_active_directory_authentication != null && length(v.azure_active_directory_authentication) > 0 }
}
output "vpn_server_configurations_client_revoked_certificate" {
  description = "Map of client_revoked_certificate values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.client_revoked_certificate if v.client_revoked_certificate != null && length(v.client_revoked_certificate) > 0 }
}
output "vpn_server_configurations_client_root_certificate" {
  description = "Map of client_root_certificate values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.client_root_certificate if v.client_root_certificate != null && length(v.client_root_certificate) > 0 }
}
output "vpn_server_configurations_ipsec_policy" {
  description = "Map of ipsec_policy values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.ipsec_policy if v.ipsec_policy != null && length(v.ipsec_policy) > 0 }
}
output "vpn_server_configurations_location" {
  description = "Map of location values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.location if v.location != null && length(v.location) > 0 }
}
output "vpn_server_configurations_name" {
  description = "Map of name values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.name if v.name != null && length(v.name) > 0 }
}
output "vpn_server_configurations_radius" {
  description = "Map of radius values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.radius if v.radius != null && length(v.radius) > 0 }
  sensitive   = true
}
output "vpn_server_configurations_resource_group_name" {
  description = "Map of resource_group_name values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "vpn_server_configurations_tags" {
  description = "Map of tags values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "vpn_server_configurations_vpn_authentication_types" {
  description = "Map of vpn_authentication_types values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.vpn_authentication_types if v.vpn_authentication_types != null && length(v.vpn_authentication_types) > 0 }
}
output "vpn_server_configurations_vpn_protocols" {
  description = "Map of vpn_protocols values across all vpn_server_configurations, keyed the same as var.vpn_server_configurations"
  value       = { for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : k => v.vpn_protocols if v.vpn_protocols != null && length(v.vpn_protocols) > 0 }
}

