# azure roles
resource "vault_azure_secret_backend" "azure" {
  count = var.azure_secrets_enabled ? 1 : 0
  use_microsoft_graph_api = true
  subscription_id         = var.azure_secrets_engine_subscription_id
  tenant_id               = var.azure_secrets_engine_tenant_id
  client_secret           = var.azure_secret_engine_client_secret
  client_id               = var.azure_secret_engine_client_id
  path                    = var.azure_secret_engine_path  
  depends_on = [
    vault_namespace.new,
  ] 
}

resource "vault_azure_secret_backend_role" "azure-secret-read" {
  count = var.azure_secrets_enabled ? 1 : 0
  backend               = vault_azure_secret_backend.azure[0].path
  role                  = "azure-secret-read"
  ttl                   = 300
  max_ttl               = 600
  application_object_id = var.azure_secrets_role_application_object_id
}

