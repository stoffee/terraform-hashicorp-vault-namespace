resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "example" {
  backend                = vault_auth_backend.kubernetes.path
  kubernetes_host        = "http://example.com:443"
  kubernetes_ca_cert     = var.kubernetes_ca_cert
  token_reviewer_jwt     = var.k8s_token_reviewer_jwt
  issuer                 = "api"
  disable_iss_validation = "true"
}