#
# AWS Auth Engine Backend
#
resource "vault_auth_backend" "aws" {
  count = var.aws_auth_enabled ? 1 : 0
  type  = "aws"
  path  = "aws"
  depends_on = [
    vault_namespace.new,
  ]
}
resource "vault_aws_auth_backend_client" "main" {
  count = var.aws_auth_enabled ? 1 : 0
  backend    = vault_auth_backend.aws[0].path
  access_key = var.aws_auth_engine_access_key
  secret_key = var.aws_auth_engine_secret_key
  depends_on = [
    vault_namespace.new,
  ]
}

resource "vault_aws_auth_backend_role" "aws-iam-creds" {
  count = var.aws_auth_enabled ? 1 : 0
  backend                  = vault_auth_backend.aws[0].path
  role                     = "aws-iam-creds"
  auth_type                = "iam"
  bound_iam_principal_arns = ["arn:aws:iam::XXXXXXXXXXXXX:user/iam-user"]
  token_ttl                = 60
  token_max_ttl            = 120
  token_policies           = ["default", "kv-rl"]
  depends_on = [
    vault_namespace.new,
  ]
}