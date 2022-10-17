terraform {
  required_providers {
    vault = "~> 3.9.1"
  }
}

provider "vault" {
  address = var.vault_addr
  token   = var.vault_token
}

#--------------------------------------
# Create new namespace
#--------------------------------------
resource "vault_namespace" "new" {
  path = var.namespace
}
