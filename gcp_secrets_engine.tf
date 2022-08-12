resource "vault_gcp_secret_backend" "gcp" {
  count = var.gcp_secrets_enabled ? 1 : 0
  #credentials = file("test-ent-vault-creds.json")
  namespace = var.namespace
  depends_on = [
    vault_namespace.new,
  ]
}

resource "vault_gcp_secret_roleset" "gcp-api-viewer" {
  count        = var.gcp_secrets_enabled ? 1 : 0
  backend      = vault_gcp_secret_backend.gcp[0].path
  roleset      = "gcp-api-viewer"
  secret_type  = "access_token"
  project      = var.gcp_secrets_engine_project
  token_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  namespace    = vault_namespace.new.path

  binding {
    resource = "//cloudresourcemanager.googleapis.com/projects/${var.gcp_secrets_engine_project}"

    roles = [
      "roles/viewer",
    ]
  }
}

resource "vault_gcp_secret_roleset" "gcp-api-owner" {
  count        = var.gcp_secrets_enabled ? 1 : 0
  namespace    = vault_namespace.new.path
  backend      = vault_gcp_secret_backend.gcp[0].path
  roleset      = "gcp-api-owner"
  secret_type  = "access_token"
  project      = var.gcp_secrets_engine_project
  token_scopes = ["https://www.googleapis.com/auth/cloud-platform"]

  binding {
    resource = "//cloudresourcemanager.googleapis.com/projects/${var.gcp_secrets_engine_project}"

    roles = [
      "roles/owner",
    ]
  }
}
