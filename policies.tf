# # Create an eaas-client policy in the new namespace
resource "vault_policy" "kv_transit_client_policy" {
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
  name      = "super-user-pol"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOT
}

resource "vault_policy" "azure_cloud_admin" {
  name      = "azure_cloud_admin"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "azure*" {
  capabilities = ["create", "read", "update", "list", "patch"]
}
EOT
}

resource "vault_policy" "kv-ro" {
  name      = "kv-ro"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "kv*" {
  capabilities = ["read", "list"]
}
EOT
}

resource "vault_policy" "adfs-kv-full" {
  name      = "adfs-kv-full"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "kv*" {
  capabilities = ["create", "read", "update", "delete", "list", "patch"]
}
EOT
}

resource "vault_policy" "approle-access" {
  name      = "approle-access"
  namespace = vault_namespace.new.path
  policy    = <<EOT
# Mount the AppRole auth method
#path "sys/auth/approle" {
 # capabilities = [ "create", "read", "update", "delete", "sudo" ]
#}

# Configure the AppRole auth method
#path "sys/auth/approle/*" {
 # capabilities = [ "create", "read", "update", "delete" ]
#}

# Create and manage roles
path "auth/approle/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}
EOT
}

resource "vault_policy" "kv-full" {
  name      = "kv-full"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "kv*" {
  capabilities = ["create", "read", "update", "delete", "list", "patch"]
}
EOT
}


resource "vault_policy" "kv-rl" {
  name      = "kv-rl"
  namespace = vault_namespace.new.path
  policy    = <<EOT
path "kv*" {
  capabilities = ["read", "list"]
}
EOT
}

resource "vault_policy" "kv-testing" {
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

