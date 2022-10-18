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