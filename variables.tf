
variable "vault_addr" {
  description = "Address of vault server to set at VAULT_ADDR"
  type        = string
}
variable "vault_token" {
  description = "Token to be used when configuring Vault"
  sensitive = true
}
variable "namespace" {
  description = "Desired name of the NAMESPACE to create and configure"
}
variable "userpass_auth_enabled" {
  description = "User Password auth for Vault"
  type        = bool
  default     = false
}
variable "kv2_enabled" {
  description = "Enabled or disable KV2"
  default = false
}
 variable "aws_auth_enabled" {
  description = "Enables AWS auth"
  type        = bool
  default     = false
}
variable "aws_auth_engine_access_key" {
  description = "AWS Access key for AWS Auth Engine"
  default     = "YOURAWSACCESSKEY"
}

variable "aws_auth_engine_secret_key" {
  description = "AWS Secret for AWS Auth Engine"
  #default = null
  sensitive = true
  default     = "YOURAWSSECREzt"
}
variable "aws_secret_enabled" {
  description = "Enables AWS secrets"
  type        = bool
  default     = false
}

variable "aws_secret_engine_access_key" {
  description = "AWS Access key for AWS Secret Engine"
}

variable "aws_secret_engine_secret_key" {
  description = "AWS Secret for AWS Secret Engine"
  #default = null
  sensitive = true
}

variable "approle_auth_enabled" {
  description = "Enables AppRole auth"
  type        = bool
  default     = false
}

variable "azure_auth_enabled" {
  description = "Enables Azure auth"
  type        = bool
  default     = false
}
variable "azure_auth_engine_tenant_id" {
  description = "Azure Tenant ID"
}
variable "azure_auth_engine_client_id" {
  description = "Azure Client ID for Azure Auth Engine"
}
variable "azure_auth_engine_client_secret" {
  description = "Azure Secret for Azure Auth Engine"
  #default = null
  sensitive = true
}
variable "azure_auth_bound_resource_groups" {
  description = "Azure Resource Groups for Azure Auth Roles"
}
variable "azure_auth_bound_subscription_ids" {
  description = "Azure Resource Groups for Azure Secret Roles"
}
variable "azure_auth_engine_resource" {
  description = "Azure Auth, This is always set to the Client ID"
}
variable "azure_secrets_enabled" {
  description = "Enables  Azure Secrets Engine"
  type        = bool
  default     = false
}
variable "azure_secret_engine_client_id" {
  description = "Azure Client ID for Azure Secret Engine"
}
variable "azure_secret_engine_client_secret" {
  description = "Azure Secret for Azure Secret Engine"
  #default = null
  sensitive = true
}
variable "azure_secrets_engine_subscription_id" {
  description = "Azure Subscription ID for Azure Secret Engine"
}
variable "azure_secrets_engine_tenant_id" {
  description = "Azure Tenant ID for Azure Secret Engine"
}
variable "azure_secret_engine_path" {
  description = "Vault path to be used for Azure Secrets Engine"
  default = "azuresecrets"
}
variable "azure_secrets_role_application_object_id" {
  description = "Azure Existing Service Principale to be used for the Roles"
}
#variable "azure_oidc_engine_client_id" {
# description = "Azure Client ID for Azure OIDC Engine"
#}
#variable "azure_oidc_engine_client_secret" {
# description = "Azure Secret for OIDC Engine"
#}
variable "gcp_auth_enabled" {
  description = "Enables GCP Auth Engine"
  type        = bool
  default     = false
}
variable "gcp_auth_engine_project_id" {
  description = "GCP Auth Engine Project ID"
}
variable "gcp_auth_engine_bound_service_accounts" {
  description = "GCP Auth Engine Bound Service Accounts https://www.vaultproject.io/docs/auth/gcp#configuration"
}
variable "gcp_auth_engine_roles" {
  description = "GCP Auth Engine Roles"
}

variable "gcp_secrets_enabled" {
  description = "Enables GCP Secrets Engine"
  type        = bool
  default     = false
}
variable "gcp_secrets_engine_project" {
  description = "GCP Secret Engine Project"
  default = "HCP-Vault"
}

variable "ldap_auth_enabled" {
  description = "Enables GCP Secrets Engine"
  type        = bool
  default     = false
}
variable "ldap_auth_engine_ldap_url" {
  description = "LDAP binddn https://www.vaultproject.io/docs/auth/ldap#binddn"
  default = "ldap://ldap.mydomain.com"
}
variable "ldap_auth_engine_bindpass" {
  description = "LDAP bindpass https://www.vaultproject.io/docs/auth/ldap#bindpass"
  sensitive=true
}
variable "ldap_auth_userdn" {
  description = "LDAP binddn https://www.vaultproject.io/docs/auth/ldap#url"
  default = "DC=na,DC=mydomain,DC=com"
}
variable "ldap_auth_userattr" {
  description = "LDAP userattr https://www.vaultproject.io/docs/auth/ldap#userattr"
  default = "cn"
}
variable "ldap_auth_groupattr" {
  description = "LDAP groupattr https://www.vaultproject.io/docs/auth/ldap#groupattr"
  default = "cn"
}
variable "ldap_auth_groupdn" {
  description = "LDAP groupdn https://www.vaultproject.io/docs/auth/ldap#groupdn"
  default = "OU=MyGroups,OU=MyOrg,OU=Exchange,DC=na,DC=MyDomain,DC=com"
}
variable "ldap_auth_groupfilter" {
  description = "LDAP groupfilter https://www.vaultproject.io/docs/auth/ldap#groupfilter"
  default = "(&(objectClass=group)(member:1.2.840.113556.1.4.1941:={{.UserDN}}))"
}
variable "ldap_auth_binddn" {
  description = "LDAP binddn https://www.vaultproject.io/docs/auth/ldap#binddn"
  default = "cn=vault_admin_user,ou=Users,dc=mydomain,dc=com"
}
variable "ldap_auth_insecure_tls" {
  description = "LDAP insecure_tls https://www.vaultproject.io/docs/auth/ldap#insecure_tls"
  default = false
}
variable "ldap_auth_starttls" {
  description = "LDAP starttls https://www.vaultproject.io/docs/auth/ldap#starttls"
  default = true
}