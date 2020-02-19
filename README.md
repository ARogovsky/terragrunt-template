![Concept](https://github.com/ARogovsky/terragrunt-template/raw/master/Project%20layout.png)

# terragrunt-template
Simple way for generate infrastructure projects in terragrunt layout style use ansible role

You will have ready for use local setup which create a minimal envirovment for terraform and move local state to remote backend

All phases is headless, so there is a good idea include them in your pipelines

For quick start you need have linux envirovment with aws cli, ansible and terraform

Clone this project and execute:
    ansible-playbook example-playbook.yml -e "aws_region=your_region aws_account=your_aws_account_number"

You will have a terraform/terragrunt enabler and project manifests in to /tmp/example

For wipe go to in local setup directory, remove backend manifest, init terraform and accept state copy to local. After use terraform destroy.
