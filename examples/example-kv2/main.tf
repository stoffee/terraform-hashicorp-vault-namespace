module "vault-namespace" {
  source = "git@github.com:stoffee/terraform-hashicorp-vault-namespace.git"

  vault_addr  = "https://vault.mydomain.com:8200"
  namespace   = "MyCoolNewNamespace"
  vault_token = "vaulttoken.ijasdiawoskjnasdokijbnasd"

  #
  # KV2
  #
  kv2_enabled = true

  #
  # LDAP Auth Engine
  #
  ldap_auth_enabled         = false

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