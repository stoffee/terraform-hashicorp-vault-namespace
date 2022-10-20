#group name
resource "vault_identity_group" "vault_admin" {
  name      = var.ldap_vault_admin_group
  type      = "external"
  policies  = ["default", "super-user-pol"]
  namespace = vault_namespace.new.path
}

#group alias for ldap
#resource "vault_identity_group_alias" "vault_admin_alias" {
#  count          = var.ldap_auth_enabled ? 1 : 0
#  name           = var.ldap_vault_admin_group
#  mount_accessor = vault_ldap_auth_backend.ldap[0].accessor
#  canonical_id   = vault_identity_group.vault_admin.id
#}

