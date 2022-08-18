resource "vault_ldap_auth_backend" "ldap" {
  path         = "ldap"
  namespace    = vault_namespace.new.path
  url          = var.ldap_auth_engine_ldap_url
  userdn       = var.ldap_auth_userdn
  userattr     = var.ldap_auth_userattr
  groupattr    = var.ldap_auth_groupattr
  groupdn      = var.ldap_auth_groupdn
  groupfilter  = var.ldap_auth_groupfilter
  binddn       = var.ldap_auth_binddn
  bindpass     = var.ldap_auth_engine_bindpass
  insecure_tls = var.ldap_auth_insecure_tls
  starttls     = var.ldap_auth_starttls
}