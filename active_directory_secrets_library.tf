resource "vault_ad_secret_backend" "account_vending" {
  count        = var.ad_secrets_enabled ? 1 : 0
    backend       = "ad"
    binddn        = "CN=Administrator,CN=Users,DC=corp,DC=example,DC=net"
    bindpass      = "SuperSecretPassw0rd"
    url           = "ldaps://ad"
    insecure_tls  = "true"
    userdn        = "CN=Users,DC=corp,DC=example,DC=net"
}

resource "vault_ad_secret_library" "qa" {
  count        = var.ad_secrets_enabled ? 1 : 0
    backend                       = vault_ad_secret_backend.account_vending[0].backend
    name                          = "qa"
    service_account_names         = ["Bob", "Mary"]
    ttl                           = 60
    disable_check_in_enforcement  = true
    max_ttl                       = 120
}