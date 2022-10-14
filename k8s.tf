resource "vault_auth_backend" "kubernetes" {
  count      = var.k8s_auth_enabled ? 1 : 0
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "example" {
  count      = var.k8s_auth_enabled ? 1 : 0
  backend                = vault_auth_backend.kubernetes[0].path
  kubernetes_host        = "http://example.com:443"
  kubernetes_ca_cert     = var.kubernetes_ca_cert
  token_reviewer_jwt     = var.k8s_token_reviewer_jwt
  issuer                 = "api"
  disable_iss_validation = "true"
}