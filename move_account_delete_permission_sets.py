import boto3
import argparse
import botocore

# Initialize boto3 clients for AWS Organizations and AWS SSO
client = boto3.client('iam')
org_client = boto3.client('organizations')
sso_admin_client = boto3.client('sso-admin')

#get the IAM Role
response = client.get_role(
    RoleName='ec2-gitlab-role',
)
print(response)

# Move Suspended Account from Managed OU to Unmanaged OU
def move_account(suspended_account_id, managed_ou_id, unmanaged_ou_id):
    try:
        # Use org_client to move the account
        response = org_client.move_account(
            AccountId=suspended_account_id,
            SourceParentId=managed_ou_id,
            DestinationParentId=unmanaged_ou_id
         )
        print("Executing move_suspended_account...")
        print(f"Suspended account Id: {suspended_account_id}")
        print(f"Source Parent Ou id: {managed_ou_id}")
        print(f"Destination Parent Ou id: {unmanaged_ou_id}")        
        print("Account moved successfully.")
        print(response)  # Print response for additional details
    except botocore.exceptions.ClientError as error:
        print(f"Error moving account: {error}")
        # Handle the error accordingly
    except botocore.exceptions.ParamValidationError as error:
        raise ValueError('The parameters you provided are incorrect: {}'.format(error))

# Delete permission set for AWS SSO
def delete_permission_set(instance_arn, permission_set_arn):

    
    try:
        # Use sso_admin_client to delete the permission set
        response = sso_admin_client.delete_permission_set(
            InstanceArn=instance_arn,
            PermissionSetArn=permission_set_arn
         )
        print("Executing delete_permission_set...")
        print(f"Instance ARN: {instance_arn}")
        print(f"Permission Set ARN: {permission_set_arn}")
        print(f"Permission set deleted successfully: {permission_set_arn}")
    except botocore.exceptions.ClientError as error:
        print(f"Error deleting permission set {permission_set_arn}: {error}")
        # Handle the error accordingly
    except botocore.exceptions.ParamValidationError as error:
        raise ValueError('The parameters you provided are incorrect: {}'.format(error))

# Move account and delete permission set
def main():
    parser = argparse.ArgumentParser()
    
    # Arguments for moving suspended account and deleting permission set
    parser.add_argument("--suspended_account_id", help="Enter the Suspended account Id", required=True)
    parser.add_argument("--managed_ou_id", help="Enter the Source Parent OU Id", required=True)
    parser.add_argument("--unmanaged_ou_id", help="Enter the Destination Parent OU Id", required=True)
    parser.add_argument("--instance_arn", help="Enter the Arn of the Instance", required=True)
    parser.add_argument("--permission_set_arn", help="Enter the Arn of Permission set", required=True)

    args = parser.parse_args()

    # Move suspended account
    move_account(args.suspended_account_id, args.managed_ou_id, args.unmanaged_ou_id)

    # Delete permission set
    delete_permission_set(args.instance_arn, args.permission_set_arn)

if __name__ == "__main__":
    main()
