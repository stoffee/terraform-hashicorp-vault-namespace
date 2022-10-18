# Hashicorp Vault Namespace Module Examples

This module only Deploys KV2 Secrets Engine and LDAP Auth Engine

## Usage

### LDAP with KV2

```hcl
module "vault-namespace" {
  source  = "stoffee/vault-namespace/hashicorp//examples/example-all"
  version = ">= 0.10.8"
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
}

variable "namespace" {
  description = "New Vault Namespace to create"
}
variable "vault_token" {
  description = "Vault Admin Token"
}
variable "vault_addr" {
  description = "Vault URL"
}
variable "ldap_vault_admin_group" {
  default = "ENTVAULT_ADMIN"
}
variable "vault_admin_policy_name" {
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

```