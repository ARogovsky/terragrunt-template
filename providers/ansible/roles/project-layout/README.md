Role Name
=========

Generate project layout in terragrunt style (https://github.com/gruntwork-io/terragrunt-infrastructure-live-example)

Requirements
------------

* terragrunt
* tfenv
* aws cli

Role Variables
--------------

Available variables are listed below, along with default values (see `defaults/main.yml`):

    aws_region: AWS Region for project
    aws_account: AWS Account Number
    aws_iam_user: Name of IAM user who own this project
    project_name: Name of project
    project_output: Output directory for layout
    project_id: Define if you want continue failed project (set existed top directory)

Dependencies
------------

None

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: username.rolename, aws_account: your_aws_account_number }

License
-------

BSD

Author Information
------------------

Andrey Rogovsky
