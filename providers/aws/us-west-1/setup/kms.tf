module "setup_key" {
  source  = "cloudposse/kms-key/aws"
  version = "0.4.0"

  namespace               = "setup"
  stage                   = var.project_env
  name                    = var.project_name
  description             = "KMS key to secure state"
  deletion_window_in_days = 7
  alias                   = "alias/${var.project_name}-${var.project_env}"
}
