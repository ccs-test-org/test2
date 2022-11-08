# CCS Custom Policies for AWS IAM 

Custom policy requirements:

1. IAM Policy documents that have statements granting any s3 actions that have a * in any of the specified resources for that statement.

2. IAM Policy documents that have the action `sts:AssumeRole` granted with a resource that specifies a role ARN from another account.

3. IAM Groups/Users/Roles that do not have permissions boundaries attached

4. IAM Policy documents that grant access to resources in another account