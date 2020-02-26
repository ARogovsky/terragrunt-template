#!/bin/bash
set -a
. ../../../../vars/env
set +a
ln -s ../../../../templates/setup/1-terraform.tf terraform.tf
terraform init
terraform plan -out setup.plan
terraform apply setup.plan
ROLE=$( terraform output role)
BUCKET=$( terraform output bucket)
KMS=$( terraform output key)
DT=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
rm terraform.tf
ln -s ../../../../templates/setup/2-terraform.tf terraform.tf
ln -s ../../../../templates/setup/2-variables.tf variables.tf

cat <<EOF >> ../../../../terragrunt.hcl
iam_role = "$ROLE"

remote_state {
  backend = "s3"

  config = {
    bucket         = "$BUCKET"
    key            = "\${path_relative_to_include()}/terraform.tfstate"
    encrypt        = true
    kms_key_id     = "$KMS"
    dynamodb_table = "terraform-lock-$DT"
    region         = "$TF_VAR_aws_region"
  }
}

locals {
  aws_region = "$TF_VAR_aws_region"
}

inputs = {
  aws_region = local.aws_region

  terraform_remote_state_s3_bucket      = "$BUCKET"
  terraform_remote_state_dynamodb_table = "terraform-lock-$DT"
  terraform_remote_state_file_name      = "terraform.tfstate"
  terraform_remote_state_kms_key        = "$KMS"
}
EOF
terragrunt init -force-copy
