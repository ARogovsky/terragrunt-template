module "admin_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "2.6.0"

  name                          = "${var.admin_user}-${var.project_name}"
  create_iam_user_login_profile = false
  create_iam_access_key         = false
}
