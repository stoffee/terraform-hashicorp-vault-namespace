# Enable Transit secrets engine at 'transit' in the 'admin/new' namespace
resource "vault_mount" "transit" {
  count                     = var.transit_engine_enabled ? 1 : 0
  path                      = var.vault_transit_path
  type                      = "transit"
  description               = var.vault_transit_description
  default_lease_ttl_seconds = var.vault_transit_default_lease
  max_lease_ttl_seconds     = var.vault_transit_max_lease
  namespace                 = vault_namespace.new.path
}

resource "vault_transit_secret_backend_key" "key" {
  backend          = var.vault_transit_path
  name             = var.vault_transit_key_name
  namespace        = vault_namespace.new.path
  deletion_allowed = true
}