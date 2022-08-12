
resource "vault_auth_backend" "gcp" {
  count = var.gcp_auth_enabled ? 1 : 0
  path  = "gcp"
  type  = "gcp"
  depends_on = [
    vault_namespace.new,
  ]
}

resource "vault_gcp_auth_backend_role" "gcp-iam-auth" {
  count                  = var.gcp_auth_enabled ? 1 : 0
  backend                = vault_auth_backend.gcp[0].path
  bound_service_accounts = var.gcp_auth_engine_bound_service_accounts
  token_policies         = ["kv-rl"]
  role                   = var.gcp_auth_engine_roles
  type                   = "iam"
}
