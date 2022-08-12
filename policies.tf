# # Create an eaas-client policy in the new namespace
resource "vault_policy" "eaas-client_policy" {
  namespace = vault_namespace.new.path
  depends_on = [vault_namespace.new]
  name   = "eaas-client"
  #policy = file("policies/eaas-client-policy.hcl")
  policy = <<EOT
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
  name = "super-user-pol"
depends_on = [
    vault_namespace.new,
  ]
  policy = <<EOT
path "*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOT
}

resource "vault_policy" "azure_cloud_admin" {
  name = "azure_cloud_admin"
depends_on = [
    vault_namespace.new,
  ]
  policy = <<EOT
path "azure*" {
  capabilities = ["create", "read", "update", "list", "patch"]
}
EOT
}

resource "vault_policy" "kv-ro" {
  name = "kv-ro"
depends_on = [
    vault_namespace.new,
  ]
  policy = <<EOT
path "kv*" {
  capabilities = ["read", "list"]
}
EOT
}

resource "vault_policy" "adfs-kv-full" {
  name = "adfs-kv-full"
depends_on = [
    vault_namespace.new,
  ]
  policy = <<EOT
path "kv*" {
  capabilities = ["create", "read", "update", "delete", "list", "patch"]
}
EOT
}

resource "vault_policy" "approle-access" {
  name = "approle-access"
depends_on = [
    vault_namespace.new,
  ]
  policy = <<EOT
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
  name = "kv-full"
depends_on = [
    vault_namespace.new,
  ]
  policy = <<EOT
path "kv*" {
  capabilities = ["create", "read", "update", "delete", "list", "patch"]
}
EOT
}


resource "vault_policy" "kv-rl" {
  name = "kv-rl"
depends_on = [
    vault_namespace.new,
  ]
  policy = <<EOT
path "kv*" {
  capabilities = ["read", "list"]
}
EOT
}

resource "vault_policy" "kv-testing" {
  name = "kv-testing"
depends_on = [
    vault_namespace.new,
  ]
  policy = <<EOT
path "kv/+/mu/it/iam/adfs/*" {
  capabilities = ["create", "read", "update", "delete", "patch"]
}

path "kv/metadata/*" {
  capabilities = ["list"]
}
EOT
}

