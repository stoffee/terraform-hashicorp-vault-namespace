#------------------------------------------------------------------------------
# The best practice is to use remote state file and encrypt it since your
# state files may contains sensitive data (secrets).
#------------------------------------------------------------------------------
# terraform {
#       backend "s3" {
#             bucket = "remote-terraform-state-dev"
#             encrypt = true
#             key = "terraform.tfstate"
#             region = "us-east-1"
#       }
# }


#------------------------------------------------------------------------------
# To leverage more than one namespace, define a vault provider per namespace
#
#   admin
#    ├── new
#    │   └── training
#    │       └── boundary
#    └── test
#------------------------------------------------------------------------------
terraform {
  required_providers {
    vault = "~> 3.8.0"
  }
}


provider "vault" {
  address = var.vault_addr
  token   = var.vault_token
}

#--------------------------------------
# Create 'admin/new' namespace
#--------------------------------------
resource "vault_namespace" "new" {
  path = var.namespace
}
