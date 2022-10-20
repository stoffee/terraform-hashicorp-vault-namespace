# approle
resource "vault_auth_backend" "approle" {
  count     = var.approle_auth_enabled ? 1 : 0
  type      = "approle"
  namespace = vault_namespace.new.path
  depends_on = [
    vault_namespace.new,
  ]
}

resource "vault_approle_auth_backend_role" "approle1" {
  count          = var.approle_auth_enabled ? 1 : 0
  backend        = vault_auth_backend.approle[0].path
  role_name      = var.approle_auth_backend_role_name
  token_policies = var.approle_auth_backend_token_policies
  namespace      = vault_namespace.new.path
}

resource "vault_approle_auth_backend_role" "kvro" {
  count          = var.approle_auth_enabled ? 1 : 0
  backend        = vault_auth_backend.approle[0].path
  role_name      = "kvro-approle"
  token_policies = ["default", "kv-ro"]
  namespace      = vault_namespace.new.path
}
