# terragrunt-template
Simple way for generate infrastructure projects in terragrunt layout style use ansible role

You will have ready for use local setup which create a minimal envirovment for terragrunt

All phases is headless, so there is a good idea include them in your pipelines

For quick start you need have linux envirovment with aws cli, ansible, terraform and terragrunt

Clone this project and execute:
    ansible-playbook example-playbook.yml -e "aws_region=your_region aws_account=your_aws_account_number"

You will have a terraform/terragrunt enabler and project manifests in to /tmp/example

For wipe minimal envirovment go to in local setup directory, run terragrunt destroy.

Warning! Terragrunt keep lock table dynamodb. You need wipe it manual:
aws dynamodb delete-table --table-name *uniq-id*-terraform-lock --region *aws-region*
