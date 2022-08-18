# Enable kv-v2 secrets engine in the 'admin/test' namespace at 'secret' path
resource "vault_mount" "secret" {
  count      = var.kv2_enabled ? 1 : 0
  depends_on = [vault_namespace.new]
  namespace  = vault_namespace.new.path
  path       = "secret"
  type       = "kv-v2"
}

# Enable Transit secrets engine at 'transit' in the 'admin/new' namespace
resource "vault_mount" "transit" {
  depends_on = [vault_namespace.new]
  namespace  = vault_namespace.new.path
  path       = "transit"
  type       = "transit"
}

# # Creating an encryption key named 'payment'
resource "vault_transit_secret_backend_key" "key" {
  depends_on       = [vault_mount.transit]
  namespace        = vault_namespace.new.path
  backend          = "transit"
  name             = "payment"
  deletion_allowed = true
}
