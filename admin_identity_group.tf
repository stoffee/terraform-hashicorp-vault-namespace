#group name
resource "vault_identity_group" "vault_admin" {
  name      = "VAULT_ADMIN"
  type      = "external"
  policies  = ["default", "super-user-pol"]
  namespace = vault_namespace.new.path
}

##group alias for ldap
##resource "vault_identity_group_alias" "vault_admin_alias" {
##  name     = "VAULT_ADMIN"
##  mount_accessor = vault_ldap_auth_backend.ldap.accessor
##  canonical_id   = vault_identity_group.vault_admin.id
##}

