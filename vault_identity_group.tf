resource "vault_identity_group" "group" {
  name     = "MyTestGroup"
  type     = "external"
  policies = ["default"]
  #  canonical_id = var.vault_identity_canonical_id
  namespace  = vault_namespace.new.path
  depends_on = [vault_namespace.new, ]
}

resource "vault_identity_group_alias" "group-alias" {
  name           = "Team_Slug"
  mount_accessor = vault_ldap_auth_backend.ldap.accessor
  canonical_id   = vault_identity_group.group.id
  namespace      = vault_namespace.new.path
  depends_on     = [vault_namespace.new, ]
}