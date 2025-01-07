# Install-DRS-Agent-on-EC2-by-PowerShell

## Project Description
This project demonstrates how to install the AWS Elastic Disaster Recovery (DRS) agent on a Windows EC2 instance. The `build_env` folder leverages Terraform to provision the environment, using `windows_2016_core_base` as the demonstration image. The workflow includes environment setup, configuring IAM permissions, and using PowerShell commands to install the DRS agent.

## Prerequisites

- An active AWS account.
- AWS CLI installed and configured with appropriate permissions.
- Terraform installed.
- Access to a PowerShell or bash environment.

## Installation Steps

### 1. Log in to Your AWS Account
Log in to your AWS account and ensure you have sufficient permissions to create IAM users and manage EC2 instances.

### 2. Initialize AWS Elastic Disaster Recovery
Follow the [AWS Elastic Disaster Recovery Guide](https://docs.aws.amazon.com/drs/latest/userguide/getting-started-initializing.html) to set up and initialize the service.

### 3. Create an AWS IAM User and Configure Permissions
Create a new IAM user in the AWS IAM Console and assign the following permissions:
- `AWSElasticDisasterRecoveryFullAccess`
- `AdministratorAccess` (or equivalent EC2 and S3 permissions)

Take note of the `Access Key` and `Secret Key` for the new user, as they will be needed to configure the AWS CLI.

### 4. Configure AWS CLI Credentials
Use the AWS CLI to configure the credentials for your IAM user. Ensure that the correct AWS region is selected.
ˋˋˋ bash
    aws configure
ˋˋˋ

### 5. Set Up the Environment Using Terraform

1. Download the project files and navigate to the project directory.
    
2. Edit the `terraform.tfvars` file to customize the parameters with your AWS details, such as:
    - `aws_access_key`
    - `aws_secret_key`
    - `aws_region` (e.g., `us-east-1`)
    - `instance_type` (e.g., `t3.micro`)

3. Run the Terraform commands to initialize and deploy the environment.
ˋˋˋ bash
    terraform init ; terraform validate ; terraform plan ; terraform apply -auto-approve 
ˋˋˋ

### 6. Install the DRS Agent

1. Once the environment is provisioned and the instance is running, use SSH or EC2 Instance Connect to log in to your EC2 instance.

2. Execute the `drs_agent_install/Installation.sh` script to install the DRS agent. Be sure to replace placeholders with your AWS Access Key and selected region.

### 7. Verify Installation
After completing the installation, navigate to the AWS Management Console. In the **AWS Elastic Disaster Recovery -> Source Server** section, you should see the DRS agent actively sending replicas to your AWS account.

## Notes

- Ensure all AWS permissions are correctly configured throughout the process.
- If you encounter any issues during the installation (particularly during the agent upload stage), refer to AWS documentation or contact AWS Support for assistance.
- If traffic flow issues arise when the agent is sending data to DRS, use the `role_debug.sh` script to reset permissions for DRS.

