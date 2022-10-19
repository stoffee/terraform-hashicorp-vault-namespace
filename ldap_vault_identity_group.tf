resource "vault_identity_group" "group" {
  count      = var.ldap_auth_enabled ? 1 : 0
  name       = "MyTestGroup"
  type       = "external"
  policies   = ["default"]
  namespace  = vault_namespace.new.path
  depends_on = [vault_namespace.new, ]
}

resource "vault_identity_group_alias" "group-alias" {
  count          = var.ldap_auth_enabled ? 1 : 0
  name           = "Test_Team"
  mount_accessor = vault_ldap_auth_backend.ldap[0].accessor
  canonical_id   = vault_identity_group.group[0].id
  namespace      = vault_namespace.new.path
  depends_on     = [vault_namespace.new, ]
}

