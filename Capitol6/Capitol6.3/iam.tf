module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 3.0"

  name          = "eugeniu.testing"
  force_destroy = true

  pgp_key = "keybase:test"

  password_reset_required = false
}