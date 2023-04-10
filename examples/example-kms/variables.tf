variable "namespace" {
  description = "New Vault Namespace to create"
}
variable "vault_token" {
  description = "Vault Admin Token"
}
variable "vault_addr" {
  description = "Vault URL"
}
variable "vault_admin_policy_name" {
  description = "Desired name of the admin policy"
  default     = "super-user-pol"
}
variable "create_vault_admin_policy" {
  description = "Create a admin policy in your new namespace?"
  type        = bool
  default     = true
}
variable "userpass_user1" {
  description = "Desired name of a user to add to Vault UserPass Auth"
  default     = "vaultuser"
}
variable "userpass_user1_password" {
  description = "Desired password of a user to add to Vault UserPass Auth"
  default     = "ChangeMe"
  sensitive   = true
}
variable "userpass_admin" {
  description = "Desired name of namespace admin user to add to Vault UserPass Auth"
  default     = "vaultnamespaceadmin"
}
variable "userpass_admin_password" {
  description = "Desired password of namespace admin user to add to Vault UserPass Auth"
  default     = null
  sensitive   = true
}
variable "aws_secret_engine_access_key" {
  description = "AWS Secret Engine Access Key"
}
variable "aws_secret_engine_secret_key" {
  description = "AWS Secret Engine Access Key"
}
variable "aws_auth_engine_access_key" {
  description = "AWS Auth Access Key"
  default     = null
  sensitive   = true
  #default     = "YOURAWSACCESS"
}
variable "aws_auth_engine_secret_key" {
  description = "AWS Auth Secret"
  default     = null
  sensitive   = true
  #default   = "YOURAWSSECREzt"
}

variable "azure_auth_engine_client_id" {
  description = "Azure Client ID for Azure Auth Engine"
}
variable "azure_auth_engine_client_secret" {
  description = "Azure Secret for Azure Auth Engine"
  #default = null
  sensitive = true
}
variable "azure_auth_engine_tenant_id" {
  description = "Azure Tenant ID"
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
  default     = "azuresecrets"
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
variable "gcp_auth_engine_project_id" {
  description = "GCP Auth Engine Project ID"
}
variable "gcp_auth_engine_bound_service_accounts" {
  description = "GCP Auth Engine Bound Service Accounts https://www.vaultproject.io/docs/auth/gcp#configuration"
}
variable "gcp_auth_engine_roles" {
  description = "GCP Auth Engine Roles"
}
variable "gcp_secrets_engine_project" {
  description = "GCP Secret Engine Project"
  default     = "HCP-Vault"
}
variable "ldap_vault_admin_group" {
  default = "ENTVAULT_ADMIN"
}
variable "ldap_vault_admin_policy_name" {
  description = "Name to give the admin policy"
  default     = "super-user-pol"
}
variable "ldap_auth_engine_ldap_url" {
  description = "LDAP binddn https://www.vaultproject.io/docs/auth/ldap#url"
  default     = "ldap://ldap.mydomain.com"
}
variable "ldap_auth_engine_bindpass" {
  description = "LDAP bindpass https://www.vaultproject.io/docs/auth/ldap#bindpass"
  sensitive   = true
}
variable "ldap_auth_userdn" {
  description = "LDAP binddn https://www.vaultproject.io/docs/auth/ldap#binddn"
  default     = "DC=na,DC=mydomain,DC=com"
}
variable "ldap_auth_userattr" {
  description = "LDAP userattr https://www.vaultproject.io/docs/auth/ldap#userattr"
  default     = "cn"
}
variable "ldap_auth_groupattr" {
  description = "LDAP groupattr https://www.vaultproject.io/docs/auth/ldap#groupattr"
  default     = "cn"
}
variable "ldap_auth_groupdn" {
  description = "LDAP groupdn https://www.vaultproject.io/docs/auth/ldap#groupdn"
  default     = "OU=MyGroups,OU=MyOrg,OU=Exchange,DC=na,DC=MyDomain,DC=com"
}
variable "ldap_auth_groupfilter" {
  description = "LDAP groupfilter https://www.vaultproject.io/docs/auth/ldap#groupfilter"
  default     = "(&(objectClass=group)(member:1.2.840.113556.1.4.1941:={{.UserDN}}))"
}
variable "ldap_auth_binddn" {
  description = "LDAP binddn https://www.vaultproject.io/docs/auth/ldap#binddn"
  default     = "cn=vault_admin_user,ou=Users,dc=mydomain,dc=com"
}
variable "ldap_auth_insecure_tls" {
  description = "LDAP insecure_tls https://www.vaultproject.io/docs/auth/ldap#insecure_tls"
  default     = false
}
variable "ldap_auth_starttls" {
  description = "LDAP starttls https://www.vaultproject.io/docs/auth/ldap#starttls"
  default     = true
}

variable "ssh_otp_engine_enabled" {
  description = "Enables SSHD OTP Engine"
  type        = bool
  default     = false
}
variable "ssh_default_user" {
  description = "Username for SSH user"
  default     = "Linux username"
}
variable "ssh_cidr_list" {
  description = "Username for SSH user"
  default     = "0.0.0.0/0"
}
variable "k8s_auth_enabled" {
  description = "Enables kubernets Auth"
  type        = bool
  default     = false
}
variable "kubernetes_ca_cert" {
  description = "CA Cert from Kubernetes"
  default     = "-----BEGIN CERTIFICATE-----\nexample\n-----END CERTIFICATE-----"
}
variable "k8s_token_reviewer_jwt" {
  description = "JWT"
  default     = "ZXhhbXBsZQo="
}
variable "ad_secrets_enabled" {
  description = "Enables Active Dirctory Secrets Engine"
  type        = bool
  default     = false
}
variable "ad_secret_engine_ttl" {
  description = "Active Dirctory Secrets Engine default TTL"
  default     = "60"
}
variable "ad_secret_engine_backend" {
  description = "Vault path for AD Secrets Engine https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/ad_secret_role#backend"
  default     = "ad"
}
variable "ad_secret_engine_binddn" {
  description = "BindDN for AD Secrets Engine"
  default     = "CN=Administrator,CN=Users,DC=corp,DC=example,DC=net"
}
variable "ad_secret_engine_bindpass" {
  description = "BindPass for AD Secrets Engine"
  default     = "SuperSecretPassw0rd"
}
variable "ad_secret_engine_ldap_url" {
  description = "LDAP URL for AD"
  default     = "ldaps://ad.mydomain.com"
}
variable "ad_secret_engine_insecure_tls" {
  description = "INsecure TLS for AD?"
  default     = true
}
variable "ad_secret_engine_userdn" {
  description = "UserDN for AD Secrets Engine"
  default     = "CN=Users,DC=corp,DC=example,DC=net"
}
variable "ad_secret_engine_role" {
  description = "Role for AD Secrets Engine https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/ad_secret_role#role"
  default     = "bob"
}
variable "ad_secret_engine_service_account_name" {
  description = "Service account name for AD Secrets Engine https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/ad_secret_role#service_account_name"
  default     = "bobs-family"
}
variable "ad_secret_engine_library_service_account_names" {
  description = "Service account names to be used in account vending machine for AD Secrets Engine https://www.vaultproject.io/docs/secrets/ad#service-account-check-out"
  default     = ["Bob", "Mary"]
}