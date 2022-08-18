# Hashicorp Vault Namespace Module Examples

This module only Deploys KV2 Secrets Engine

## Usage

### LDAP with KV2

```hcl
module "vault-namespace" {
  source = "git@github.com:stoffee/terraform-hashicorp-vault-namespace.git"

  vault_addr  = var.vault_addr
  namespace   = var.namespace
  vault_token = var.vault_token

  #
  # KV2
  #
  kv2_enabled = true

  #
  # Transit Engine
  #
  transit_engine_enabled = false

  #
  # LDAP Auth Engine
  #
  ldap_auth_enabled  = false

  #
  # Active Directory Secrets
  #
  ad_secrets_enabled = false

  #
  # AppRole Auth
  #
  userpass_auth_enabled = false

  #
  # AppRole Auth
  #
  approle_auth_enabled = false

  #
  # AWS Auth
  #
  aws_auth_enabled           = false

  #
  # AWS Secrets Engine
  #
  aws_secret_enabled           = false


  #
  # Azure Auth
  #
  azure_auth_enabled                = false

  #
  # Azure Secrets Engine
  #
  azure_secrets_enabled                    = false

  #
  # GCP Auth Engine
  #
  gcp_auth_enabled                       = false

  #
  # GCP Secrets Engine
  #
  gcp_secrets_enabled        = false
}

```