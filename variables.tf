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
    azure_active_directory_authentication = optional(object({
      audience = string
      issuer   = string
      tenant   = string
    }))
    client_revoked_certificate = optional(object({
      name       = string
      thumbprint = string
    }))
    client_root_certificate = optional(object({
      name             = string
      public_cert_data = string
    }))
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
      client_root_certificate = optional(object({
        name       = string
        thumbprint = string
      }))
      server = optional(object({
        address = string
        score   = number
        secret  = string
      }))
      server_root_certificate = optional(object({
        name             = string
        public_cert_data = string
      }))
    }))
  }))
}

