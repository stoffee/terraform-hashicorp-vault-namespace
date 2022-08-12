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
  aws_auth_engine_access_key = "false"
  aws_auth_engine_secret_key = "false"

  #
  # AWS Secrets Engine
  #
  aws_secret_enabled           = false
  aws_secret_engine_access_key = "false"
  aws_secret_engine_secret_key = "false"


  #
  # Azure Auth
  #
  azure_auth_enabled                = false
  azure_auth_engine_tenant_id       = "false"
  azure_auth_bound_resource_groups  = "false"
  azure_auth_engine_client_id       = "false"
  azure_auth_engine_client_secret   = "false"
  azure_auth_bound_subscription_ids = "false"
  azure_auth_engine_resource        = "false"
  azure_secret_engine_client_id     = "false"
  azure_secret_engine_client_secret = "false"

  #
  # Azure Secrets Engine
  #
  azure_secrets_enabled                    = false
  azure_secrets_engine_subscription_id     = "false"
  azure_secrets_engine_tenant_id           = "false"
  azure_secrets_role_application_object_id = "false"

  #
  # GCP Auth Engine
  #
  gcp_auth_enabled                       = false
  gcp_auth_engine_project_id             = "false"
  gcp_auth_engine_bound_service_accounts = "false"
  gcp_auth_engine_roles                  = "false"

  #
  # GCP Secrets Engine
  #
  gcp_secrets_enabled        = false
  gcp_secrets_engine_project = "false"
}
