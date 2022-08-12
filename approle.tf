# approle
resource "vault_auth_backend" "approle" {
  count = var.approle_auth_enabled ? 1 : 0
  type = "approle"
  depends_on = [
    vault_namespace.new,
  ]
}

resource "vault_approle_auth_backend_role" "kvfull" {
  count = var.approle_auth_enabled ? 1 : 0
  backend        = vault_auth_backend.approle[0].path
  role_name      = "kvfull-approle"
  token_policies = ["default", "kv-full"]
}

resource "vault_approle_auth_backend_role" "kvro" {
  count = var.approle_auth_enabled ? 1 : 0
  backend        = vault_auth_backend.approle[0].path
  role_name      = "kvro-approle"
  token_policies = ["default", "kv-ro"]
}