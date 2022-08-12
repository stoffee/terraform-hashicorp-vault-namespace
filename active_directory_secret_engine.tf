resource "vault_ad_secret_backend" "config" {
  count        = var.ad_secrets_enabled ? 1 : 0
  backend      = var.ad_secret_engine_backend
  binddn       = var.ad_secret_engine_binddn
  bindpass     = var.ad_secret_engine_bindpass
  url          = var.ad_secret_engine_ldap_url
  insecure_tls = var.ad_secret_engine_insecure_tls
  userdn       = var.ad_secret_engine_userdn
}

resource "vault_ad_secret_role" "role" {
  count                = var.ad_secrets_enabled ? 1 : 0
  backend              = vault_ad_secret_backend.config[0].backend
  role                 = var.ad_secret_engine_role
  service_account_name = var.ad_secret_engine_service_account_name
  ttl                  = 60
}