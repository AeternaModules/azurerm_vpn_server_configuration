output "vpn_server_configurations" {
  description = "All vpn_server_configuration resources"
  value       = azurerm_vpn_server_configuration.vpn_server_configurations
  sensitive   = true
}
output "vpn_server_configurations_azure_active_directory_authentication" {
  description = "List of azure_active_directory_authentication values across all vpn_server_configurations"
  value       = [for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : v.azure_active_directory_authentication]
}
output "vpn_server_configurations_client_revoked_certificate" {
  description = "List of client_revoked_certificate values across all vpn_server_configurations"
  value       = [for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : v.client_revoked_certificate]
}
output "vpn_server_configurations_client_root_certificate" {
  description = "List of client_root_certificate values across all vpn_server_configurations"
  value       = [for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : v.client_root_certificate]
}
output "vpn_server_configurations_ipsec_policy" {
  description = "List of ipsec_policy values across all vpn_server_configurations"
  value       = [for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : v.ipsec_policy]
}
output "vpn_server_configurations_location" {
  description = "List of location values across all vpn_server_configurations"
  value       = [for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : v.location]
}
output "vpn_server_configurations_name" {
  description = "List of name values across all vpn_server_configurations"
  value       = [for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : v.name]
}
output "vpn_server_configurations_radius" {
  description = "List of radius values across all vpn_server_configurations"
  value       = [for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : v.radius]
  sensitive   = true
}
output "vpn_server_configurations_resource_group_name" {
  description = "List of resource_group_name values across all vpn_server_configurations"
  value       = [for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : v.resource_group_name]
}
output "vpn_server_configurations_tags" {
  description = "List of tags values across all vpn_server_configurations"
  value       = [for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : v.tags]
}
output "vpn_server_configurations_vpn_authentication_types" {
  description = "List of vpn_authentication_types values across all vpn_server_configurations"
  value       = [for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : v.vpn_authentication_types]
}
output "vpn_server_configurations_vpn_protocols" {
  description = "List of vpn_protocols values across all vpn_server_configurations"
  value       = [for k, v in azurerm_vpn_server_configuration.vpn_server_configurations : v.vpn_protocols]
}

