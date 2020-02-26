terraform {
  required_version = "0.12.18"
  # Intentionally empty. Will be filled by Terragrunt.
  backend "s3" {}
}
