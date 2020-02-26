module "admin_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "2.6.0"

  role_name = "admin-${var.project_name}"

  trusted_role_arns = [
    module.admin_user.this_iam_user_arn,
    var.caller_id,
  ]

  create_role         = true
  attach_admin_policy = true
  role_requires_mfa   = true
}


module "terraform_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "2.6.0"

  role_name = "terraform-${var.project_name}"

  trusted_role_arns = [
    module.admin_role.this_iam_role_arn,
    var.caller_id,
  ]

  create_role         = true
  attach_admin_policy = true
  role_requires_mfa   = false
}
