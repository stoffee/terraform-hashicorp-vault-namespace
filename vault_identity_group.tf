resource "vault_identity_group" "group" {
  name         = "test"
  type         = "external"
  policies     = ["test"]
  canonical_id = var.vault_identity_canonical_id
  namespace    = vault_namespace.new.path
  depends_on   = [vault_namespace.new, ]
}

#resource "vault_auth_backend" "github" {
#  type = "github"
#  path = "github"
#}

resource "vault_identity_group_alias" "group-alias" {
  name           = "Github_Team_Slug"
  mount_accessor = vault_ldap_auth_backend.ldap.accessor
  canonical_id   = vault_identity_group.group.id
  namespace      = vault_namespace.new.path
  depends_on     = [vault_namespace.new, ]
}