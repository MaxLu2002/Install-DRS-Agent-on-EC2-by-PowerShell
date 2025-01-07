# Step 1: Create IAM Roles
aws iam create-role --path "/service-role/" --role-name AWSElasticDisasterRecoveryAgentRole --assume-role-policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"drs.amazonaws.com"},"Action":["sts:AssumeRole","sts:SetSourceIdentity"],"Condition":{"StringLike":{"sts:SourceIdentity":"s-*","aws:SourceAccount":"369432261332"}}}]}'
aws iam create-role --path "/service-role/" --role-name AWSElasticDisasterRecoveryFailbackRole --assume-role-policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"drs.amazonaws.com"},"Action":["sts:AssumeRole","sts:SetSourceIdentity"],"Condition":{"StringLike":{"aws:SourceAccount":"369432261332","sts:SourceIdentity":"i-*"}}}]}'
aws iam create-role --path "/service-role/" --role-name AWSElasticDisasterRecoveryConversionServerRole --assume-role-policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}'
aws iam create-role --path "/service-role/" --role-name AWSElasticDisasterRecoveryRecoveryInstanceRole --assume-role-policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}'
aws iam create-role --path "/service-role/" --role-name AWSElasticDisasterRecoveryReplicationServerRole --assume-role-policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}'
aws iam create-role --path "/service-role/" --role-name AWSElasticDisasterRecoveryRecoveryInstanceWithLaunchActionsRole --assume-role-policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}'

# Step 2: Attach Managed Policies to Roles
aws iam attach-role-policy --role-name AWSElasticDisasterRecoveryAgentRole --policy-arn arn:aws:iam::aws:policy/service-role/AWSElasticDisasterRecoveryAgentPolicy
aws iam attach-role-policy --role-name AWSElasticDisasterRecoveryFailbackRole --policy-arn arn:aws:iam::aws:policy/service-role/AWSElasticDisasterRecoveryFailbackPolicy
aws iam attach-role-policy --role-name AWSElasticDisasterRecoveryConversionServerRole --policy-arn arn:aws:iam::aws:policy/service-role/AWSElasticDisasterRecoveryConversionServerPolicy
aws iam attach-role-policy --role-name AWSElasticDisasterRecoveryRecoveryInstanceRole --policy-arn arn:aws:iam::aws:policy/service-role/AWSElasticDisasterRecoveryRecoveryInstancePolicy
aws iam attach-role-policy --role-name AWSElasticDisasterRecoveryReplicationServerRole --policy-arn arn:aws:iam::aws:policy/service-role/AWSElasticDisasterRecoveryReplicationServerPolicy
aws iam attach-role-policy --role-name AWSElasticDisasterRecoveryRecoveryInstanceWithLaunchActionsRole --policy-arn arn:aws:iam::aws:policy/service-role/AWSElasticDisasterRecoveryRecoveryInstancePolicy
aws iam attach-role-policy --role-name AWSElasticDisasterRecoveryRecoveryInstanceWithLaunchActionsRole --policy-arn arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore

# Step 3: Initialize the AWS DRS Service
aws drs initialize-service
