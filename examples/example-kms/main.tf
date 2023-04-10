module "vault-namespace" {
  source  = "stoffee/vault-namespace/hashicorp"
  version = "~> 0.11.0"
  # for local module usage
  #source = "../../"

  vault_addr  = var.vault_addr
  namespace   = var.namespace
  vault_token = var.vault_token

  #
  # Policies
  #
  vault_admin_policy_name   = var.vault_admin_policy_name
  create_vault_admin_policy = var.create_vault_admin_policy

  #
  # KV2
  #
  kv2_enabled                         = false

  #
  # Transit Engine
  #
  transit_engine_enabled = false

  #
  # UserPass Auth
  #
  userpass_auth_enabled   = false

  #
  # AppRole Auth
  #
  approle_auth_enabled = false

  #
  # Active Directory Secrets
  #
  ad_secrets_enabled                             = false

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

  #
  # GCP Secrets Engine
  #
  ldap_auth_enabled            = false

  #
  # SSH OTP
  #
  ssh_otp_engine_enabled = false

  #
  # Kubernetes Auth
  #
  k8s_auth_enabled       = false
}
