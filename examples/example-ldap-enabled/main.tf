module "vault-namespace" {
  source = "git@github.com:stoffee/terraform-hashicorp-vault-namespace.git"
  #source = "../../"

  vault_addr  = var.vault_addr
  namespace   = var.namespace
  vault_token = var.vault_token

  #
  # KV2
  #
  kv2_enabled = true


  #
  # LDAP Auth Engine
  #
  ldap_auth_enabled         = true
  ldap_auth_engine_ldap_url = var.ldap_auth_engine_ldap_url
  ldap_auth_engine_bindpass = var.ldap_auth_engine_bindpass
  ldap_auth_userdn          = var.ldap_auth_userdn
  ldap_auth_userattr        = var.ldap_auth_userattr
  ldap_auth_groupattr       = var.ldap_auth_groupattr
  ldap_auth_groupdn         = var.ldap_auth_groupdn
  ldap_auth_groupfilter     = var.ldap_auth_groupfilter
  ldap_auth_binddn          = var.ldap_auth_binddn
  ldap_auth_insecure_tls    = var.ldap_auth_insecure_tls
  ldap_auth_starttls        = var.ldap_auth_starttls

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
