variable "vpn_server_configurations" {
  description = <<EOT
Map of vpn_server_configurations, attributes below
Required:
    - location
    - name
    - resource_group_name
    - vpn_authentication_types
Optional:
    - tags
    - vpn_protocols
    - azure_active_directory_authentication (block):
        - audience (required)
        - issuer (required)
        - tenant (required)
    - client_revoked_certificate (block):
        - name (required)
        - thumbprint (required)
    - client_root_certificate (block):
        - name (required)
        - public_cert_data (required)
    - ipsec_policy (block):
        - dh_group (required)
        - ike_encryption (required)
        - ike_integrity (required)
        - ipsec_encryption (required)
        - ipsec_integrity (required)
        - pfs_group (required)
        - sa_data_size_kilobytes (required)
        - sa_lifetime_seconds (required)
    - radius (block):
        - client_root_certificate (optional, block):
            - name (required)
            - thumbprint (required)
        - server (optional, block):
            - address (required)
            - score (required)
            - secret (required)
        - server_root_certificate (optional, block):
            - name (required)
            - public_cert_data (required)
EOT

  type = map(object({
    location                 = string
    name                     = string
    resource_group_name      = string
    vpn_authentication_types = list(string)
    tags                     = optional(map(string))
    vpn_protocols            = optional(set(string))
    azure_active_directory_authentication = optional(list(object({
      audience = string
      issuer   = string
      tenant   = string
    })))
    client_revoked_certificate = optional(list(object({
      name       = string
      thumbprint = string
    })))
    client_root_certificate = optional(list(object({
      name             = string
      public_cert_data = string
    })))
    ipsec_policy = optional(object({
      dh_group               = string
      ike_encryption         = string
      ike_integrity          = string
      ipsec_encryption       = string
      ipsec_integrity        = string
      pfs_group              = string
      sa_data_size_kilobytes = number
      sa_lifetime_seconds    = number
    }))
    radius = optional(object({
      client_root_certificate = optional(list(object({
        name       = string
        thumbprint = string
      })))
      server = optional(list(object({
        address = string
        score   = number
        secret  = string
      })))
      server_root_certificate = optional(list(object({
        name             = string
        public_cert_data = string
      })))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.vpn_server_configurations : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_server_configurations : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_server_configurations : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_server_configurations : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_server_configurations : (
        v.radius == null || (v.radius.server == null || alltrue([for item in v.radius.server : (length(item.address) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_server_configurations : (
        v.radius == null || (v.radius.server == null || alltrue([for item in v.radius.server : (length(item.secret) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_server_configurations : (
        v.radius == null || (v.radius.server == null || alltrue([for item in v.radius.server : (item.score >= 1 && item.score <= 30)]))
      )
    ])
    error_message = "must be between 1 and 30"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_server_configurations : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 13 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

