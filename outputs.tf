output "namespace" {
  description = "The namespace path"
  value       = vault_namespace.new.path
}
output "vault_ldap_auth_backend_mount_accessor" {
  description = "The ldap auth backend accessor"
  value       = vault_ldap_auth_backend.ldap[0].accessor
}
output "vault_admin_identity_group_canonical_id" {
  description = "The ldap auth backend accessor"
  value       = vault_identity_group.vault_admin.id
}