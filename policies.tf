# # Create an eaas-client policy in the new namespace
resource "vault_policy" "kv_transit_client_policy" {
  count      = var.transit_engine_enabled ? 1 : 0
  namespace  = vault_namespace.new.path
  depends_on = [vault_namespace.new]
  name       = "kv-transit-client"
  policy     = <<EOT
  # Permits CRUD operation on kv-v2
path "kv-v2/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Encrypt data with 'payment' key
path "transit/encrypt/payment" {
  capabilities = ["update"]
}

# Decrypt data with 'payment' key
path "transit/decrypt/payment" {
  capabilities = ["update"]
}

# Read and list keys under transit secrets engine 
path "transit/*" {
  capabilities = ["read", "list"]
}
EOT
}

resource "vault_policy" "super-user-pol" {
  count     = var.create_vault_admin_policy ? 1 : 0
  name      = var.vault_admin_policy_name
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOT
}

resource "vault_policy" "azure_cloud_admin" {
  count     = var.azure_auth_enabled ? 1 : 0
  name      = "azure_cloud_admin"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "azure*" {
  capabilities = ["create", "read", "update", "list", "patch"]
}
EOT
}
resource "vault_policy" "aws_cloud_admin" {
  count     = var.aws_auth_enabled ? 1 : 0
  name      = "aws_cloud_admin"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "aws*" {
  capabilities = ["create", "read", "update", "list", "patch"]
}
EOT
}
resource "vault_policy" "gcp_cloud_admin" {
  count     = var.gcp_auth_enabled ? 1 : 0
  name      = "gcp_cloud_admin"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "gcp*" {
  capabilities = ["create", "read", "update", "list", "patch"]
}
EOT
}

resource "vault_policy" "kv-ro" {
  count     = var.kv2_enabled ? 1 : 0
  name      = "kv-ro"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "kv*" {
  capabilities = ["read", "list"]
}
EOT
}

resource "vault_policy" "adfs-kv-full" {
  count     = var.kv2_enabled ? 1 : 0
  name      = "adfs-kv-full"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "kv*" {
  capabilities = ["create", "read", "update", "delete", "list", "patch"]
}
EOT
}

resource "vault_policy" "approle-access" {
  count     = var.approle_auth_enabled ? 1 : 0
  name      = "approle-access"
  namespace = vault_namespace.new.path
  policy    = <<EOT
# Mount the AppRole auth method
path "sys/auth/approle" {
  capabilities = [ "create", "read", "update", "delete", "sudo" ]
}

# Configure the AppRole auth method
path "sys/auth/approle/*" {
  capabilities = [ "create", "read", "update", "delete" ]
}

# Create and manage roles
path "auth/approle/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}
EOT
}

resource "vault_policy" "kv-full" {
  count     = var.kv2_enabled ? 1 : 0
  name      = "kv-full"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "kv*" {
  capabilities = ["create", "read", "update", "delete", "list", "patch"]
}
EOT
}


resource "vault_policy" "kv-rl" {
  count     = var.kv2_enabled ? 1 : 0
  name      = "kv-rl"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "kv*" {
  capabilities = ["read", "list"]
}
EOT
}

resource "vault_policy" "kv-testing" {
  count     = var.kv2_enabled ? 1 : 0
  name      = "kv-testing"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "kv/*" {
  capabilities = ["create", "read", "update", "delete", "patch"]
}

path "kv/metadata/*" {
  capabilities = ["list"]
}
EOT
}

