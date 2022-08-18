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
  # Transit Engine
  #
  transit_engine_enabled = true

  #
  # UserPass Auth
  #
  userpass_auth_enabled   = true
  userpass_user1          = var.userpass_user1
  userpass_user1_password = var.userpass_user1_password
  userpass_admin          = var.userpass_admin
  userpass_admin_password = var.userpass_admin_password

  #
  # AppRole Auth
  #
  approle_auth_enabled = true

  #
  # AWS Auth
  #
  aws_auth_enabled           = true
  aws_auth_engine_access_key = var.aws_auth_engine_access_key
  aws_auth_engine_secret_key = var.aws_auth_engine_secret_key

  #
  # AWS Secrets Engine
  #
  aws_secret_enabled           = true
  aws_secret_engine_access_key = var.aws_secret_engine_access_key
  aws_secret_engine_secret_key = var.aws_secret_engine_secret_key


  #
  # Azure Auth
  #
  azure_auth_enabled                = true
  azure_auth_engine_tenant_id       = var.azure_auth_engine_tenant_id
  azure_auth_bound_resource_groups  = var.azure_auth_bound_resource_groups
  azure_auth_engine_client_id       = var.azure_auth_engine_client_id
  azure_auth_engine_client_secret   = var.azure_auth_engine_client_secret
  azure_auth_bound_subscription_ids = var.azure_auth_bound_subscription_ids
  azure_auth_engine_resource        = var.azure_auth_engine_resource
  azure_secret_engine_client_id     = var.azure_secret_engine_client_id
  azure_secret_engine_client_secret = var.azure_secret_engine_client_secret

  #
  # Azure Secrets Engine
  #
  azure_secrets_enabled                    = true
  azure_secrets_engine_subscription_id     = var.azure_secrets_engine_subscription_id
  azure_secrets_engine_tenant_id           = var.azure_secrets_engine_tenant_id
  azure_secrets_role_application_object_id = var.azure_secrets_role_application_object_id

  #
  # GCP Auth Engine
  #
  gcp_auth_enabled                       = true
  gcp_auth_engine_project_id             = var.gcp_auth_engine_project_id
  gcp_auth_engine_bound_service_accounts = var.gcp_auth_engine_bound_service_accounts
  gcp_auth_engine_roles                  = var.gcp_auth_engine_roles

  #
  # GCP Secrets Engine
  #
  gcp_secrets_enabled        = true
  gcp_secrets_engine_project = var.gcp_secrets_engine_project

  #
  # GCP Secrets Engine
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

}
