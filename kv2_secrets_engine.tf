# Enable kv-v2 secrets engine in the 'admin/test' namespace at 'secret' path
resource "vault_mount" "secret" {
  count      = var.kv2_enabled ? 1 : 0
  depends_on = [vault_namespace.new]
  namespace  = vault_namespace.new.path
  path       = var.kv_secrets_path_name
  type       = "kv-v2"
}
