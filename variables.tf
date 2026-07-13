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
  # --- Unconfirmed validation candidates, derived from azurerm_vpn_server_configuration's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: vpn_authentication_types[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ipsec_policy.dh_group
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ipsec_policy.ike_encryption
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ipsec_policy.ike_integrity
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ipsec_policy.ipsec_encryption
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ipsec_policy.ipsec_integrity
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ipsec_policy.pfs_group
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: radius.server.address
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: radius.server.secret
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: radius.server.score
  #   condition: value >= 1 && value <= 30
  #   message:   must be between 1 and 30
  # path: vpn_protocols[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

