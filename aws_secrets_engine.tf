#AWs Secrets Engine
resource "vault_aws_secret_backend" "aws" {
  count      = var.aws_secret_enabled ? 1 : 0
  access_key = var.aws_secret_engine_access_key
  secret_key = var.aws_secret_engine_secret_key
  depends_on = [
    vault_namespace.new,
  ]
}

resource "vault_aws_secret_backend_role" "aws-iam-creds" {
  count           = var.aws_secret_enabled ? 1 : 0
  backend         = vault_aws_secret_backend.aws[0].path
  name            = "aws-iam-creds"
  credential_type = "iam_user"

  policy_document = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "iam:*",
      "Resource": "*"
    }
  ]
}
EOT
}